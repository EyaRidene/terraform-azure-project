# React App + Terraform Deployment on Azure

This project demonstrates how to **deploy a React application** to an **Azure Virtual Machine** using **Terraform**. The repository includes:

- A **React app** (stored in a GitHub repo) that is automatically cloned and served on port **80**.
- **Terraform** scripts for creating:
  - Azure Resource Group
  - Virtual Network + Subnet
  - Network Security Group (NSG) with rules for SSH (22) and HTTP (80)
  - Public IP
  - Network Interface
  - Ubuntu Linux VM with Node.js/npm installed and the React app served on port 80

## Table of Contents

1. [Project Structure](#project-structure)
2. [Prerequisites](#prerequisites)
3. [Terraform Setup & Deployment](#terraform-setup--deployment)
4. [Accessing the Application](#accessing-the-application)
5. [Variables](#variables)
6. [Outputs](#outputs)
7. [Authentication Options](#authentication-options)
8. [Destroying the Resources](#destroying-the-resources)
9. [Troubleshooting](#troubleshooting)

---

## Project Structure

├── main.tf # Main Terraform configuration 
├── variables.tf # Terraform variables for customization 
├── outputs.tf # Terraform outputs (public IP, resource group name) 
├── README.md # This README file 
└── (React App repo) # Cloned dynamically when provisioning the VM


1. **main.tf**: Contains all Azure resource definitions (resource group, VNet, subnet, NSG, public IP, NIC, Linux VM).  
2. **variables.tf**: Defines user-configurable variables like location, admin username, SSH key paths, etc.  
3. **outputs.tf**: Prints key information (e.g., VM’s public IP) after creation.  

> **Note**: The **React application** is stored in a separate GitHub repository. During VM provisioning, Terraform will **clone** that repo, run `npm install`, `npm run build`, and start a local server on port 80.

---

## Prerequisites

1. **Azure Subscription**  
   You need an active Azure subscription for resource creation.

2. **Terraform**  
   - Install [Terraform](https://www.terraform.io/downloads.html) (version 1.0+ recommended).
   - Verify with:  
     ```bash
     terraform --version
     ```

3. **Azure CLI** (optional, for local auth)  
   - Install [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli).
   - Verify with:  
     ```bash
     az --version
     ```

4. **SSH key pair**  
   - Required for logging into the VM and for Terraform’s remote-exec provisioner.
   - Defaults in this project:  
     - Public key: `~/.ssh/id_rsa.pub`
     - Private key: `~/.ssh/id_rsa`

You can adjust paths in `variables.tf` if needed.

---

## Terraform Setup & Deployment

### Step 1: Clone This Repository

```bash
git clone https://github.com/<YOUR_ACCOUNT>/<THIS_REPO>.git
cd <THIS_REPO>
```
### Step 1: Authenticate to Azure

```bash
az login
```

### Step 1: Initialize Terraform

```bash
terraform init
```

### Step 1: Review the Plan
```bash
terraform plan
```

### Step 1: Deploy
```bash
terraform apply
```

## Accessing the Application
1. After a successful apply, check the Terraform output for vm_public_ip.
2. Open a web browser and navigate to: http://<PUBLIC_IP>
3. You should see the React application’s homepage.