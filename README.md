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

## 💻 Console Access

On your local terminal:

```bash
cd /path/to/your/ssh/key
ssh -i "ICT_20863.pem" ubuntu@<your-ec2-ip>
