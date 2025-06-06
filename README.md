# ✅ Task 3: Infrastructure as Code (IaC) with Terraform & Docker

This task was part of my DevOps internship where I provisioned a Docker container using **Terraform** on my Windows PC. I applied Infrastructure as Code principles to automate container deployment.

---

## 🚀 What I Did

- Installed **Terraform CLI** on my Windows machine.
- Ensured **Docker Desktop** was installed and running.
- Configured Docker Engine to allow Terraform to communicate via named pipe (`npipe://`).
- Created a GitHub repository and cloned it locally.
- Created the `main.tf` Terraform configuration file to:
  - Define the Docker provider.
  - Pull the `nginx:latest` image.
  - Create and start a Docker container exposing port 8080.
- Used **WSL (Ubuntu)** terminal to run Terraform commands.
- Ran `terraform init`, `terraform plan`, and `terraform apply` to provision the container.
- Verified the container was running and accessible at `http://localhost:8080`.
- Captured screenshots and console logs for evidence.

---

## 📂 Project Structure

```
|ID-4-IaC-Terraform
|   .terraform.lock.hcl
|   console.log
|   main.tf
|   README.md
|   Screenshot1.png
|   terraform.tfstate
|   terraform.tfstate.backup
```

---

## 🧪 Tools & Technologies Used

| Tool         | Purpose                                  |
|--------------|------------------------------------------|
| Terraform    | IaC tool to provision Docker container   |
| Docker       | Container runtime environment             |
| WSL (Ubuntu) | Terminal environment to run Terraform    |
| Git & GitHub | Version control and code repository       |

---

## 💻 Commands I Used

```bash
# Verify Terraform installation
terraform -version

# Clone the GitHub repo
git clone https://github.com/my-username/ID-4-IaC-Terraform.git
cd ID-4-IaC-Terraform

# Initialize Terraform (download providers)
terraform init

# Preview the changes Terraform will make
terraform plan

# Apply the configuration and provision resources
terraform apply

# Confirm with 'yes' to create the container

# Optional: Destroy resources
terraform destroy
