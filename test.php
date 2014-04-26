<?php

class HrmController extends CController
{
	CONST PROJECTID = 20;
	static $awards_limit=array(
		'diamond'=>10,
		'ticket'=>50,
		'product'=>15
	);
	public function actionDownload()
	{
		header("Content-type:text/html;charset=utf8");
		$this->render('download');
	}
	public function actionActorPhoto(){
		$photoDir='/data/www/pr-upload/images/huorenmu/';
		$photoBaseUrl='http://www.3ovie.com/pr-upload/images/huorenmu/';
		$actors=array('ruffalo','laurent','kelly','harrelson','freeman','franco','fisher','eisenberg','caine');
		if(isset($_GET['actor']) && !empty($_GET['actor'])){
			$actor=$_GET['actor'];

			if(in_array($actor, $actors)){
				$photoDir.=$actor.'/';
				$photoBaseUrl.=$actor.'/';
			}else{
				echo json_encode(array('success'=>false,'error'=>'没有这个演员的图片'));
				exit;
			}
		}else{
			echo json_encode(array('success'=>false,'error'=>'请提供演员名字'));
			exit;
		}
		$photos=array();
		// $photos=array('success'=>true,'error'=>'');
		if(is_dir($photoDir) && is_readable($photoDir)){
			$handler=opendir($photoDir);
			while (false!==($fileName=readdir($handler))) {
				if(filetype($photoDir.$fileName)=='file'){
					$photoUrl=$photoBaseUrl.$fileName;
					array_push($photos, $photoUrl);
				}
			}
			closedir($handler);
			echo json_encode($photos);
		}else{
			echo json_encode(array('success'=>false,'error'=>'无法访问目录'));
		}
	}
	public function actionVideo()
	{
		$video = Video::model()->readVideo(self::PROJECTID);
		echo json_encode($video);
	}

	public function actionPoster()
	{
		$poster = Poster::model()->readPoster(self::PROJECTID);
		echo json_encode($poster);
	}
	public function actionActivity(){

		$sql = sprintf("SELECT * FROM activities WHERE projectid=%s", self::PROJECTID);
		$data = $this->_getQueryAll($sql);
		if(empty($data)){

			$ctime =date("Y-m-d H:i:s",time());
			$sql = sprintf("INSERT INTO activities (`projectid`,`status`,`ctime`) VALUES('%s',0,'%s')", self::PROJECTID, $ctime);
			$num = $this->_getExecute($sql);
		}
		if(!$this->_countNum() && $data[0]['status']!="-1"){
			$sql = sprintf("UPDATE activities SET `status`='%s' WHERE projectid=%s",-1,self::PROJECTID);
			$num = $this->_getExecute($sql);
		}

		$this->render('Activity',array('status' => $data[0]['status'] ));
	}
	private function _checkUserPermission(){
		if(!isset($_SERVER['PHP_AUTH_USER'])) {
			Header("WWW-authenticate: basic realm=\"activity\"");
			Header("HTTP/1.0 401 Unauthorized");

		}else{

			$user = $_SERVER['PHP_AUTH_USER'];
			$password = $_SERVER['PHP_AUTH_PW'];
			if ($user == '3ovie' && $password == 'shuimu') {
				return true;
			}else{
				Header("WWW-authenticate: basic realm=\"activity\"");
				Header("HTTP/1.0 401 Unauthorized");
			}
		}
		return false;
	}
	private function _checkPermission(){
		if(!isset($_SERVER['PHP_AUTH_USER'])) {
			Header("WWW-authenticate: basic realm=\"my realm\"");
			Header("HTTP/1.0 401 Unauthorized");

		}else{

			$user = $_SERVER['PHP_AUTH_USER'];
			$password = $_SERVER['PHP_AUTH_PW'];
			if ($user == 'admin' && $password == 'lookmobile') {
				return true;
			}else{
				Header("WWW-authenticate: basic realm=\"my realm\"");
				Header("HTTP/1.0 401 Unauthorized");
			}
		}
		return false;
	}
	public function actionActivityAdmin(){
		if(!$this->_checkPermission()){
			exit("Permission Forbidden");
		};
		if(Yii::app()->request->isPostRequest){
			if(isset($_POST['date']) && isset($_POST['time'])){
				$starttime= date("Y-m-d H:i:s",strtotime($_POST['date']." ".$_POST['time'] ));
				if(strtotime($starttime) <= time() ){
					$status='1';
				}else{$status='0';
				}
				$limitnum=intval($_POST['limitnum']);
				$sql = sprintf("UPDATE activities SET `starttime`='%s',`status`='%s',`limitnum`=%d WHERE projectid=%s", $starttime,$status,$limitnum,self::PROJECTID);
				$num = $this->_getExecute($sql);
				$this->redirect('/prdoorhost.php/nysm/Activityadmin');
			}else{
				exit("Permission Forbidden");
			}

		}else{

			$sql = sprintf("SELECT * FROM activities WHERE projectid=%s", self::PROJECTID);
			$data = $this->_getQueryAll($sql);
			$winners=$this->actionAllWinner();
			$winners2=array();
			if(!empty($winners)){
				foreach ($winners as $key => $value) {
					// $len=strlen($value);
					//$winners2[]= str_pad(substr($value, 0, 4),$len,'*');
					$winners2[]= $value;
				}
			}
			if($data[0]['starttime']!=null){
				$datetime=explode(" " , $data[0]['starttime']);
				$date=$datetime[0];
				$time=$datetime[1];
			}else{
				// $datetime=explode(" " , $data[0]['starttime']);
				$date="";
				$time="";
			}

			$this->render('ActivityAdmin',array(
				'winners'=>$winners2,
				"date"=>$date,
				"time"=>$time,
				'data' => $data[0],
				'title' => '惊天魔盗团活动管理'));
		}


	}
	/**
	 *
	 * 根据奖品类型获取是否还有存货
	 *
	 */
	public function actionAwardAvailable(){
		if(isset($_POST['type'])){
			$type=$_POST['type'];
			$available=$this->_awardAvailable($type);
			$status=(int) $available;
			echo json_encode(array('status' => $status));
		}

	}
	private function _awardAvailable($type){
		$sql = sprintf("SELECT COUNT(id) FROM mobile_table WHERE projectid=%s and type='%s'", self::PROJECTID,$type);
		$data = $this->_getQueryRow($sql);
		$sql = sprintf("SELECT * FROM activities WHERE projectid=%s", self::PROJECTID);
		$result = $this->_getQueryAll($sql);
		if ($data['COUNT(id)'] < self::$awards_limit[$type]) {
			return true;
		}else{
			return false;
		}
	}
	public function actionActivityStatus()
	{
		header("Content-type:application/json;charset=utf-8;");
		$num = $this->_countNum();
		echo json_encode(array('status' => $num));
	}
	public function actionUserClicked(){

		$imei=$_POST['imei'];

		$sql = sprintf("SELECT imei FROM activity_user_clicked WHERE projectid=%s AND imei='%s'", self::PROJECTID, $imei);
		$data = $this->_getQueryRow($sql);
		if($data==null){
			$sql = sprintf("INSERT INTO activity_user_clicked (`projectid`,`imei`) VALUES('%s','%s')", self::PROJECTID, $imei);
			$num = $this->_getExecute($sql);
			echo json_encode(array('status' => 0));
		}else{
			echo json_encode(array('status' => 1));
		}

	}
	public function actionWinner()
	{
		header("Content-type:application/json;charset=utf-8;");
		if(isset($_POST['weixin']) && isset($_POST['type']) && isset($_POST['imei'])){
			$imei=$_POST['imei'];
			$weixin = $_POST['weixin'];
			$type=$_POST['type'];
			$address="";
			if(isset($_POST['address'])){
				$address=$_POST['address'];
			}
			$ctime = date("Y-m-d H:i:s", time());
			$imeiExistsnum=$this->_imeiExists($imei);

			if($imeiExistsnum==1){
				echo json_encode(array('status' => 5)); //手机号码已经存在
				exit;
			}
			$existsnum = $this->_exists($weixin);
			if ($existsnum == 1) {
				echo json_encode(array('status' => 4)); //手机号码已经存在
				exit;
			}
			$available = $this->_awardAvailable($type);
			if (!$available) {
				echo json_encode(array('status' => 2));//奖品发放完
				exit;
			}else{
				$sql = sprintf("INSERT INTO mobile_table (`projectid`,`weixin`,`ctime`,`type`,`imei`,`address`) VALUES('%s','%s','%s','%s','%s','%s')", self::PROJECTID, $weixin, $ctime,$type,$imei,$address);
				$num = $this->_getExecute($sql);

				if ($num > 0) {
					echo json_encode(array('status' => 3)); //送票成功
					exit;
				}
			}
		}

	}
	public function actionAllWinner()
	{
		$sql = sprintf("SELECT * FROM mobile_table WHERE projectid=%s", self::PROJECTID);
		$data = $this->_getQueryAll($sql);
		if(Yii::app()->getRequest()->getIsAjaxRequest()){
			header("Content-type:application/json;charset=utf-8;");
			echo json_encode($data);
		}
		$res=array();
		if(!empty($data)){
			foreach ($data as $key => $value) {
				$res[]=$value;
			}
			return $res;
		}else{
			return array();
		}

	}

	private function _countNum()
	{
		$sql = sprintf("SELECT COUNT(id) FROM mobile_table WHERE projectid=%s", self::PROJECTID);
		$data = $this->_getQueryRow($sql);
		$sql = sprintf("SELECT * FROM activities WHERE projectid=%s", self::PROJECTID);
		$result = $this->_getQueryAll($sql);
		if ($data['COUNT(id)'] < $result[0]['limitnum']) {
			return 1;
		}else{
			return 0;
		}
	}
	private function _exists($weixin)
	{

		$sql = sprintf("SELECT id FROM mobile_table WHERE projectid=%s AND weixin='%s'",self::PROJECTID,$weixin);

		$num = $this->_getExecute($sql);
		if ($num > 0) {
			return 1;
		}else{
			return 0;
		}
	}
	private function _imeiExists($imei)
	{

		$sql = sprintf("SELECT id FROM mobile_table WHERE projectid=%s AND imei='%s'",self::PROJECTID,$imei);

		$num = $this->_getExecute($sql);
		if ($num > 0) {
			return 1;
		}else{
			return 0;
		}
	}
	private function _getQueryAll($sql)
	{
		$db = Yii::app()->db;
		$db->createCommand()->reset();
		$datas = $db->createCommand($sql)->queryAll();
		return $datas;
	}
	/**
	 * 执行sql语句，查询并返回结果中的第一行
	 * @param  string $sql
	 * @return mixed
	 */
	private function _getQueryRow($sql)
	{
		$db = Yii::app()->db;
		$db->createCommand()->reset();
		$datas = $db->createCommand($sql)->queryRow();
		return $datas;
	}

	/**
	 * 执行sql语句，执行无查询 SQL
	 * @param  string $sql
	 * @return mixed
	 */
	private function _getExecute($sql)
	{
		$db = Yii::app()->db;
		$db->createCommand()->reset();
		return $db->createCommand($sql)->execute();
	}
}