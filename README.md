# THE SERVER COMMANDE

**Provisioning a Secure Web Server on AWS EC2 with Nginx (Amazon Linux)**

![AWS EC2](https://img.shields.io/badge/AWS%20EC2-FF9900?logo=amazonaws&logoColor=white&style=for-the-badge)
![Nginx](https://img.shields.io/badge/Nginx-009639?logo=nginx&logoColor=white&style=for-the-badge)
![Amazon Linux](https://img.shields.io/badge/Amazon%20Linux-FF9900?logo=amazonaws&logoColor=white&style=for-the-badge)

## Scenario

A startup is launching a new dynamic application and requires full control over the operating system to install custom software, apply security patches, and configure the environment exactly as needed.

**Your Mission**: Act as a SysAdmin to provision a virtual server in the cloud using **AWS EC2 (Amazon Linux)**, securely connect via SSH, install and configure **Nginx** as the web server, and deploy a custom welcome page.

This project demonstrates foundational cloud infrastructure and server management skills using Amazon Linux.

## Benefits

* **Full OS Control**: Complete administrative access to install any software.
* **High Customizability**: Perfect for applications needing specific configurations.
* **Cost Efficiency**: Pay only for compute hours (Free Tier eligible).
* **Optimized for AWS**: Amazon Linux is tuned for AWS services and offers excellent performance.
* **Hands-on Learning**: Master EC2, SSH, Linux, and web server deployment.

## Features

* Automated Nginx installation and configuration via bash script
* Custom "Welcome to DecodeLabs" landing page
* Secure SSH access
* File transfer using SCP

## File Structure

```bash
.
├── src/
│   └── index.html          # Custom welcome page
├── scripts/
│   └── setup.sh            # Bash script to install & configure Nginx
├── .gitignore
└── README.md
```

## Technologies Used

* AWS EC2 • Amazon Linux 2023 • Nginx • Bash • SSH / SCP

---

## Complete Step-by-Step Guide (AWS Console)

### Step 1: Launch an EC2 Instance
1. Log in to the [AWS Management Console](https://console.aws.amazon.com/).
2. Go to **EC2** → **Launch instance**.
3. **Name**: `Server-Commander`
4. **AMI**: Select **Amazon Linux 2023 AMI** (recommended).
5. **Instance type**: `t2.micro` (Free Tier eligible).
6. Create a new **Key pair** (e.g., `server-commander-key`) and **download the `.pem` file**.
7. Under **Network settings**:
   * Allow **SSH** (port 22) from your IP (recommended) or `0.0.0.0/0`.
   * Allow **HTTP** (port 80) from `0.0.0.0/0`.
8. Launch the instance and wait until the status is **Running**.

### Step 2: Copy Files from Local Machine to EC2 using SCP
Once your instance is running:

1. Open your terminal (macOS/Linux) or Git Bash / WSL (Windows).
2. Navigate to the root of this repository:

```bash
cd /path/to/your/repo
```

3. Set correct permissions on your key and copy the files:

```bash
# Set correct permissions
chmod 400 server-commander-key.pem

# Copy entire project to EC2 (Recommended)
scp -i "server-commander-key.pem" -r . ec2-user@<YOUR-EC2-PUBLIC-IP>:/home/ec2-user/server-commander
```

**Alternative (Copy individual files):**

```bash
scp -i "server-commander-key.pem" src/index.html ec2-user@<YOUR-EC2-PUBLIC-IP>:/home/ec2-user/
scp -i "server-commander-key.pem" scripts/setup.sh ec2-user@<YOUR-EC2-PUBLIC-IP>:/home/ec2-user/
```

> Replace `<YOUR-EC2-PUBLIC-IP>` with the **Public IPv4 address** from the EC2 console.

### Step 3: Connect to the EC2 Instance via SSH

```bash
ssh -i "server-commander-key.pem" ec2-user@<YOUR-EC2-PUBLIC-IP>
```

### Step 4: Run the Setup Script
Once logged into the server:

```bash
# Navigate to project directory
cd ~/server-commander

# Make script executable
chmod +x scripts/setup.sh

# Run the setup script
sudo ./scripts/setup.sh
```

### Step 5: Verify the Deployment
* Open your browser and go to: `http://<YOUR-EC2-PUBLIC-IP>`
* You should see the custom **"Welcome to DecodeLabs"** welcome page.

---

## Setup Script (`scripts/setup.sh`)

The script is designed for **Amazon Linux 2023** and performs:
* System update using `dnf`
* Installation of Nginx
* Deployment of `index.html` to the web root
* Starting and enabling Nginx service

## Security Best Practices

* Never commit your `.pem` key file to Git.
* Restrict Security Group rules to your specific IP in production.
* Keep the system updated regularly.

## Enhancements (Next Steps)

* Add SSL certificate using Let's Encrypt
* Configure custom domain with Route 53
* Set up application monitoring with Amazon CloudWatch
* Implement CI/CD pipeline

## Contributing

Feel free to improve the setup script, enhance the HTML design, or add support for other features.

## License

MIT License

---

**Mastering Cloud Servers on Amazon Linux • One Command at a Time**

*Keywords: AWS EC2, Amazon Linux, Nginx, SysAdmin, SSH, SCP, Cloud Infrastructure*
