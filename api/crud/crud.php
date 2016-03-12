<?php
require_once("../connection/dbconn.php");

class crud{

	protected $db;

	function __construct($db){
		$this->db = $db;
	}

	function insert($tablename,$cols,$vals){

		$query = "INSERT INTO ".$tablename." (";
		$len = sizeof($cols);
		for($i=0;$i<$len-1;$i++){
			$query = $query."`".$cols[$i]."`,";
		}
		$query = $query."`".$cols[$len-1]."`) VALUES (";

		$len = sizeof($vals);
		for($i=0;$i<$len-1;$i++){
			$query = $query."'".$vals[$i]."',";
		}
		$query = $query."'".$vals[$len-1]."')";
		echo $query;
		//$this->db->query($query);
			if ($this->db->query($query) === TRUE) {
			    echo "New record created successfully";
			} else {
			    echo "Error: " . $query . "<br>" . $this->db->error;
			}
	}//end fn

	function returnLatestID($tablename,$col){
		$query = "SELECT `".$col."` FROM ".$tablename." ORDER BY ".$col." DESC LIMIT 1";
		$result = $this->db->query($query);
		if ($result) {
			    echo "latest record fetched successfully";
		} else {
			    echo "Error: " . $query . "<br>" . $this->db->error;
		}
		 /* fetch associative array */
	    while ($row = $result->fetch_assoc()) {
	        return $row[$col];
	    }
	}//end fn

	function fetchResultSet($tablename){
		$query = "SELECT * FROM ".$tablename." LIMIT 10";
		$result = $this->db->query($query);
		if ($result) {
			    return $result;
		} else {
			    echo "Error: " . $query . "<br>" . $this->db->error;
		}
	}//end fn

	function fetchSingleResultSet($tablename,$col,$val){
		$query = "SELECT * FROM ".$tablename." WHERE `".$col."` = ".$val;	
		$result = $this->db->query($query);
		if ($result) {
			    return $result;
		} else {
			    echo "Error: " . $query . "<br>" . $this->db->error;
		}
	}

}

?>