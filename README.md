# 🌐 ICT171 Cloud Server Project

**Student Name:** Garvpreet Singh  
**Student Number:** [Your Student Number]  
**Server IP Address:** 13.238.194.41  
**DNS Entry:** [https://beyondknown.xyz](https://beyondknown.xyz)  
**GitHub Repository:** [https://github.com/Garvpreet-35520863/ict171-server](https://github.com/Garvpreet-35520863/ict171-server)  
**Video Explainer:** [Link to video hosted on YouTube or similar platform]

---

## 📘 Introduction

This document outlines the process of setting up a cloud-based web server on Amazon EC2 using Ubuntu. The server hosts a Travel Blog site accessible via a custom domain (`beyondknown.xyz`) with SSL/TLS encryption. A custom Bash script is used to automate backups. The goal is to make this process easily replicable by peers or IT staff in under an hour.

---

## 🖥️ Server Setup

1. Log in to the AWS Management Console.
2. Navigate to **EC2 > Instances > Launch Instances**.
3. Configure the instance:
   - **Name:** `ict171-server`
   - **AMI:** Ubuntu Server 22.04 LTS (HVM), SSD Volume Type
   - **Instance Type:** `t2.micro` (Free Tier eligible)
   - **Key Pair:** Create or select an SSH key pair
   - **Network Settings:** Allow HTTP (80), HTTPS (443), and SSH (22)
   - **Storage:** 8 GB gp2 SSD
4. Launch the instance and note the **Public IP Address**.
5. Navigate to **Instances > Connect > SSH client** and copy the SSH command.

---

## 💻 Console Access to the Virtual Machine
Open the Linux command line on your device. Then use 'cd' to move to the directory where you downloaded your key.Then you can paste the string that was provided to you above.

On your local terminal:

    cd /home/garvpreet/Downloads
    
Then you can paste the string that was provided to you above.

    ssh -i "ICT_20863.pem" ubuntu@ec2-13-238-194-41.ap-southeast-2.compute.amazonaws.com
Once you have command-line access to your virtual machine, the apt repositories may be out of date. Before you install anything, it is often a good idea to update them with

Use

    sudo apt update
Install the Apache Web Server using:

    sudo apt install apache2
Now that you have installed Apache, we need to ensure we have the read, write and execute access to the/var/www/hrml directory.

Use

    cd /var/www/html
Followed by

    ls -la
If Not then

    sudo chmod 755 /var/www/html
Now that we have acces to the folder we will design and upload our file.
To remove existing or trash file in folder use

    rm /var/www/html/*
It removes all fles in the html folder.

## 🌐 Upload Website on Server IP Address

On your machine use 'cd' to move to the directory where you have stored your html, css and other important file for website.
Use:
SCP(secure copy)
scp is a command-line tool used to securely copy files or directories between:
•	Your local machine ↔️ a remote server
It uses SSH encryption, so it’s secure and doesn't need extra setup if SSH is already working.
Syntax -> 

    scp -i path to key -r path of file/directory to copy ubuntu@ip address:path to destination
In our Case:

    scp -i /home/Garvpreet/Downloads/ICT_20863.pem -r /home/Garvpreet/Downloads/ICT171 ubuntu@13.238.194.41:/var/www/html/
SSH into your VM and type ->

    cd /var/www/html

Once you are into the destination check if the files are properly uploaded. Use

    ls -la

Open your IP address and make sure your website functions properly.

**Configure DNS**
1.	Log in to your domain registrar (Namecheap in my case).
2.	Buy a Domain Name(beyondknown.xyz)
3.	Open your Domain setting and under advanced DNS
4.	Set an A Record 
•	Host: @ 
•	Value: 13.238.194.41(your IP address)
•	TTL: 3600/automatic
•	Save and
5.	Wait for DNS propagation (usually <1 hour).
Type http://beyondknown.xyz and make sure your site is accessible via domain name.

This uses the HTTP (Hypertext Transfer Protocol), which allows us to check if the server is correctly serving web content over port 80. At this point, communication between the client and server is not encrypted — meaning any data transferred can potentially be intercepted.
To secure the website, we install an SSL/TLS certificate via Let’s Encrypt and use HTTPS (HTTP Secure) instead. HTTPS encrypts the data between the browser and the server, protecting users’ privacy and ensuring data integrity. It also helps gain user trust and avoids "Not Secure" warnings in browsers.
After SSL is installed, we will test: https://beyondknown.xyz

**Obtaining a SSL/TLS Certificate**
1. Ensure snapd is installed
(If you're on Ubuntu 20.04+ or Debian 10+, it's usually preinstalled)

       sudo apt update
       sudo apt install snapd

2. Install Certbot via Snap

       sudo snap install --classic certbot

3. Run Certbot to Get an SSL Certificate

       sudo certbot --apache
   This automatically edits your config and reloads the web server.

4. Test Renewal
Let’s Encrypt certificates are valid for 90 days, so test auto-renewal:

       sudo certbot renew --dry-run
Your site should now have HTTPS. You can check by visiting https://beyondknown.xyz .
