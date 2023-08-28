# terraform-module-variables-example

Demonstrating a couple of ways to populate variables of a module

## The module setup

```
$ cat modules/VDI/variables.tf
variable "teams" {
  type = map(object({
    team_name = string
    location  = string
  }))
}
```

## `method_one`

The data that the module expects is hard coded in the call to the module.

```
$ cat method_one/main.tf
module "demo" {
  source = "../modules/VDI"
  teams = {
    "team1" = { team_name = "frontend", location = "Denver" }
    "team2" = { team_name = "backend", location = "Chicago" }
    "team3" = { team_name = "ml", location = "Boston" }
    "team4" = { team_name = "data_science", location = "New York" }
    "team5" = { team_name = "ai", location = "San Francisco" }
  }
}
```

## `method_two`

The variable to be passed in is defined, but with an `any` type.

```
$ cat method_two/{variables.tf,main.tf}
variable "teams" {
  type = any
}

module "demo" {
  source = "../modules/VDI"
  teams  = var.teams
}
```

## `method_three`

The variable to be passed in is defined with the same type as what the module is leveraging.

```
$ cat method_three/{variables.tf,main.tf}
variable "teams" {
  type = map(object({
    team_name = string
    location  = string
  }))
}

module "demo" {
  source = "../modules/VDI"
  teams  = var.teams
}
```
