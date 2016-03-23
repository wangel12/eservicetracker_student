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
    	@$fname = $request->fname;
    	@$checked = $request->checked;
    	@$lname = $request->lname;
    	@$email = $request->email;
    	@$gradYear = $request->gradYear;
    	@$password = $request->password;

		$db = new dbconn();
		$dbconn = $db->getConnection();
		$crud = new crud($dbconn);
		$crud->insert("students",array('std_fname','std_lname','std_email','std_gradYear','std_password','std_agreement','std_isActive'),array($fname,$lname,$email,$gradYear,$password,$checked,1))
?>