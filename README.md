<a id="readme-top"></a>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![Apache License][license-shield]][license-url]



<br />

<h3 align="center">PivotLab</h3>

  <p align="center">
This range is intended to be an exercise for cybersecurity professionals to gain exposure to pivoting tools and tradecraft.  There are many other tools out there, and this is surely just hitting some of the wavetops for some of the most popular tools.
</p>

</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

Broadly speaking, this lab includes the use of three different types of tools:

- live off the land tools
- non-native binaries
- webshells

The lab consists of three jump boxes with different web servers, and two "target" machines for exploitation.  All of the machines except for one of the targets is Debian-based.  The three web servers include a tomcat server for jsp webshells, an apache server for php webshells, and an nginx server.  All of the machines can be administered through the ssh key provided on the kali attack box as the root user, including the two "target" machines.



<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Getting Started

This guide assumes the user already has Promox and Ludus installed.

### Installation


1. Clone the repo
   ```sh
   git clone https://github.com/CleverNamesTaken/PivotLab.git
   ```
2. Add the necessary roles
   ```sh
   cd PivotLab
   ludus ansible role add -d roles/attackBox/
   ludus ansible role add -d roles/fvarovillodres.lamp/
   ludus ansible role add -d roles/lamp/
   ludus ansible role add -d roles/linuxTarget/
   ludus ansible role add -d roles/nginx/
   ludus ansible role add -d roles/tom/
   ludus ansible role add -d roles/tomcat/
   ludus ansible role add -d roles/windowsTarget/
   ```

3. Import the range config file
   ```sh
   ludus range config set -f range-config.yml
   ```
4. Deploy the range
   ```sh
   ludus range deploy
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Usage

Feel free to test any number of pivoting tools you'd like.  The `Conops.md` file contains a walkthrough on basic usage of the following tools, which are pre-installed on the Kali attack box at 10.<RANGE_NUMBER>.20.201:

- ssh
- iptables
- socat
- ligolo
- gost
- Chisel
- SSF
- sshuttle
- suo5
- Neo-reGeorg
- pivotnacci

ssh to 10.<RANGE_NUMBER>.20.201 with the credentials `kali:kali`, and check out the `~/tools` directory for pre-installed tools.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Top contributors:

<a href="https://github.com/CleverNamesTaken/PivotLab/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=CleverNamesTaken/PivotLab" alt="contrib.rocks image" />
</a>



<!-- LICENSE -->
## License

Distributed under the Apache License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Project Link: [https://github.com/CleverNamesTaken/PivotLab](https://github.com/CleverNamesTaken/PivotLab)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Eric (Bad Sector Labs)](https://gitlab.com/badsectorlabs) for all the amazing work on Ludus.
* opsdisk and the incredible [Cyber Plumber's Handbook](https://github.com/opsdisk/the_cyber_plumbers_handbook)
* fvarovillodres for his development of the [ansible-role for installing a LAMP stack](https://github.com/fvarovillodres/ansible-role-lamp)


<p align="right">(<a href="#readme-top">back to top</a>)</p>


[contributors-shield]: https://img.shields.io/github/contributors/CleverNamesTaken/PivotLab.svg?style=for-the-badge
[contributors-url]: https://github.com/CleverNamesTaken/PivotLab/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/CleverNamesTaken/PivotLab.svg?style=for-the-badge
[forks-url]: https://github.com/CleverNamesTaken/PivotLab/network/members
[stars-shield]: https://img.shields.io/github/stars/CleverNamesTaken/PivotLab.svg?style=for-the-badge
[stars-url]: https://github.com/CleverNamesTaken/PivotLab/stargazers
[issues-shield]: https://img.shields.io/github/issues/CleverNamesTaken/PivotLab.svg?style=for-the-badge
[issues-url]: https://github.com/CleverNamesTaken/PivotLab/issues
[license-shield]: https://img.shields.io/github/license/CleverNamesTaken/PivotLab.svg?style=for-the-badge
[license-url]: https://github.com/CleverNamesTaken/PivotLab/blob/master/LICENSE.txt
