About
-----

Recipes to setup official minos cloud images for [terraform](https://www.terraform.io/):

| Core                                                           | Desktop                                                              |
| -------------------------------------------------------------- | -------------------------------------------------------------------- |
| [core-16.04](https://github.com/minos-org/terraforms/blob/master/minos-core-16.04/) | [desktop-16.04](https://github.com/minos-org/terraforms/blob/master/minos-desktop-16.04/) |
| [core-18.04](https://github.com/minos-org/terraforms/blob/master/minos-core-18.04/) | [desktop-18.04](https://github.com/minos-org/terraforms/blob/master/minos-desktop-18.04/) |

Usage
-----

    $ cd minos-$edition-$version/

    $ terraform init
    $ terraform plan
    $ terraform apply
    $ terraform show
    $ terraform destroy


Dependencies
------------

- [Terraform](https://www.terraform.io/)
