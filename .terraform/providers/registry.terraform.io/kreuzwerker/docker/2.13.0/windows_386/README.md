# 🚀 Task 3 - Infrastructure as Code (IaC) with Terraform & Docker

## 📌 Objective

The objective of this task was to provision a local Docker container using Terraform, applying the principles of Infrastructure as Code (IaC).

---

## 🧰 Tools & Technologies Used

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [WSL (Ubuntu)]
- Git & GitHub

---

## 🧱 Steps I Performed

### ✅ Step 1: Installed Terraform

I downloaded and installed Terraform CLI from the [official Terraform website](https://developer.hashicorp.com/terraform/downloads). After installation, I verified it using:

```bash
terraform -version
```

### ✅ Step 2: Docker Setup

Docker Desktop was already preinstalled on my system. I ensured it was running correctly and integrated with WSL2.

---

## 🔧 Configuring Docker for Terraform

To allow Terraform to connect with Docker on my Windows machine, I modified the Docker Engine settings:

1. I opened Docker Desktop → ⚙️ Settings → Docker Engine.
2. I added the "hosts" parameter to enable communication via Windows named pipe.

### 🔧 Updated Docker Engine JSON

```json
{
  "builder": {
    "gc": {
      "defaultKeepStorage": "20GB",
      "enabled": true
    }
  },
  "experimental": false,
  "hosts": ["npipe://"]
}
```

3. Then, I clicked Apply & Restart.

---

## 📁 Project Initialization

### Step 3: Created and Cloned GitHub Repository

I created a new repository on GitHub for this task and cloned it locally using:

```bash
git clone https://github.com/Harsh2227kumar/ID-4-IaC-Terraform/.git
cd task-3-terraform-docker
```

---

## ✍️ Step 4: Wrote the Terraform Configuration

I created a file named `main.tf` and added the following code to define the Docker image and container:

```hcl
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx_server" {
  name  = "nginx_container"
  image = docker_image.nginx.name
  ports {
    internal = 80
    external = 8080
  }
}

```

---

## 🐧 Step 5: Used WSL (Ubuntu) to Run Terraform Commands

I opened the terminal in Docker Desktop and switched to Ubuntu via WSL. Then, I navigated to my project directory:

```bash
wsl
cd /mnt/f/Internship/Day\ 4/ID-4-IaC-Terraform
```

---

## ⚙️ Step 6: Executed Terraform Workflow

### 🔹 Initialized Terraform

I initialized the working directory to download necessary providers:

```bash
terraform init
```

### 🔹 Planned the Infrastructure

I checked what changes Terraform would make:

```bash
terraform plan
```

### 🔹 Applied the Configuration

I created the Docker image and container using:

```bash
terraform apply
```

I confirmed with `yes` when prompted.

---

## ✅ Result

- Terraform pulled the **nginx:latest** image.
- It created and started a Docker container named `nginx_container`.
- The container was visible in Docker Desktop.
- I successfully accessed the running container at:

```
http://localhost:8080
```

---

## 🧼 Optional Cleanup

To clean up the container and image, I used:

```bash
terraform destroy
```

---

## 📤 GitHub Submission

I committed and pushed the following files to my GitHub repository:

- `main.tf`
- `README.md`
- (Optional) Screenshots folder

```bash
git add .
git commit -m "Completed Task 3 - Terraform Docker provisioning"
git push origin main
```

---

## 📸 Screenshots (Optional)

- Docker container running
- Terraform output logs
- Nginx welcome page in browser

---

## 👨‍💻 About Me

- **Name:** _[Your Name Here]_
- **Internship Day:** 4
- **Task ID:** ID-4-IaC-Terraform

---

## 🏁 Conclusion

By completing this task, I learned how to:
- Use Terraform to provision Docker resources
- Apply Infrastructure as Code (IaC) principles
- Automate container creation in a reproducible and version-controlled way
