<?php 
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
if ( "OPTIONS" === $_SERVER['REQUEST_METHOD'] ) {
die();
}
require_once('../connection/dbconn.php');
require_once('../crud/crud.php');
       /*
	   * Collect all Details from Angular HTTP Request.
	   */ 
	    $postdata = file_get_contents("php://input");
	    $request = json_decode($postdata);
    	@$orgname = $request->orgname;
    	@$siteaddress = $request->siteaddress;
    	@$hours = $request->hours;
    	@$advisor = $request->advisor;
    	@$serviceType = $request->serviceType;
    	@$supervisor = $request->supervisor;
    	@$telephone = $request->telephone;
    	@$sMail = $request->sMail;
    
	  	$db = new dbconn();
		$dbconn = $db->getConnection();
		$crud = new crud($dbconn);

		$crud->insert("services",array('std_id','ser_date','adv_id','sers_id'),array('1','','1','3'));
		$last_id = $crud->returnLatestID("services","ser_id");
		$crud->insert("organizations",array('org_name','org_address','ser_id'),array($orgname,$siteaddress,$last_id));
		$crud->insert("supervisors",array('ser_id','sup_fname','sup_email','sup_phone'),array($last_id,$supervisor,$sMail,$telephone));
?>