<?php

	class ServiceList{
		protected $crud;
		function __construct($crud){
			$this->crud = $crud;
		}
		function listServices(){
				
				
				$rs = $this->crud->fetchResultSet("services");
				
				$rows = array();
				$i=0;
				while($row = $rs->fetch_assoc()){
					
					//$rows = arra
					$ser_id = $row["ser_id"];
					//$rows["data"][$i] = $ser_id;
					$orgrs = $this->crud->fetchSingleResultSet("organizations","ser_id",$row['ser_id']);
					
					$j=0;
					while($innrow = $orgrs->fetch_assoc()){
						$rows["data"]["$i"]["ser_id"] = $row["ser_id"];
						$rows["data"]["$i"]["sers_id"] = $row["sers_id"];
						$rows["data"]["$i"]["org_name"] = $innrow["org_name"];
						$rows["data"]["$i"]["org_address"] = $innrow["org_address"];
						$j++;
					}
					$i++;
					
				}
				// print "<pre>";
				// print_r($rows);
				// print "</pre>";
				echo json_encode($rows);
		}//end fn

	}//end class

?>