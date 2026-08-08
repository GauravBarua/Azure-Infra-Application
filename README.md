# Azure Infrastructure - Terraform

Infrastructure as Code (IaC) project for provisioning and managing Azure infrastructure using Terraform.

The project follows a modular Terraform architecture so that infrastructure components can be reused across multiple environments such as Development, QA, PPE, and Production.

---

## Architecture

The infrastructure is being built incrementally using Terraform.

Current architecture:

```text
Azure Subscription
        |
        v
Resource Group
        |
        v
      VNet
        |
   +----+----+
   |         |
   v         v
App Subnet  Data Subnet