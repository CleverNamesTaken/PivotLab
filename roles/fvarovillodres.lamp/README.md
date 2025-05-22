[![GitHub forks](https://img.shields.io/github/forks/fvarovillodres/ansible-role-lamp.svg?style=social&label=Fork&style=flat-square)]() [![GitHub last commit](https://img.shields.io/github/last-commit/fvarovillodres/ansible-role-lamp.svg?style=flat-square)]()

# Ansible Role: LAMP
=========

Simple instalation of a LAMP stack on Debian/Ubuntu or RHEL/CentOS

## Instalation
------------

$ ansible-galaxy install fvarovillodres.lamp

## Requirements

No special requirements; note that this role requires root access, so either run it in a playbook with a global `become: yes`, or invoke the role in your playbook like:

    - hosts: database
      roles:
        - role: fvarovillodres.lamp
          become: yes

## Role Variables
--------------

You can change the document root of Apache in `vars/main.yml` . You are free to change any part of the rol and adapt it to your needs

## Example Playbook
----------------

    - hosts: all
      become: yes
      roles:
        - fvarovillodres.lamp

## Author Information
------------------

Francisco M Varo Villodres, SysAdmin in Málaga, Spain.
