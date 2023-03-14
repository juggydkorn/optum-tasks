# optum-tasks

1	Deploy docker image	o	Setup jenkins in a docker image 
•	Linux
•	This image should be built/deployed on an event
o	Use any open source code to create a docker image having . 
•	Env variables that code might use.
•	Host machine mac should be assigned to this image.
•	Image should be able to read a file from host machine.
•	Image should be writing log file to the host machine.
•	Configurable variable like ports etc.
•	On image build, it should trigger jenkins build post build complete.
o	Jenkins then should take backup of existing image
o	Add current image to image repository (setup on local)
o	Deploy image on local	
2	Create Chef cookbook	o	To setup a machine
o	A base cookbook to include all the basic configuration on a server. (Make use of providers)
o	Additional configuration should be as below 
•	OS selection
•	Packages to harden the server.
•	Node latest
•	Java latest
•	Entries to host file
•	Setup access via databags(ssh key based)
•	Set up send-email utility on server.
o	 Cookbook should be a template and re-usable for multiple machines
	
3	Setup terraform on local	o	Create terraform modules to complete below solution. Use docker images to configure this architecture. 
o	Setup up 3 tier arch 
•	Tier 1 - A Frontend web server
•	Tier 2 - A backend Application server
•	Tier 2 - A backend database server
o	Web server should have public network access.
o	Backend servers should not have network access.
o	Application and database servers should communicate with the Web server.
The web server should make use of a index.html sample html file to confirm web server is working.
	
4	Configure a Kubernetes cluster using terraform.	o	Install Grafana agent on one of the pod and setup grafana monitoring on that pod.
o	Setup two web servers on kubernetes pods and install all the packages required to provision the servers to a web server using chef.
o	Monitor these pods using Grafana.
o	Test autoscaling on these servers by putting extra load on these servers and have the auto scaling setup in your environment provision an extra server if memory usage is more than 90%.(use kube-scheduler)

