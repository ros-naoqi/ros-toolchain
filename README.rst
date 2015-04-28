Description
===========
This is a repository which includes pre-compiled toolchain packages for include ROS into naoqi


HowTo
=====


Automatic Update
----------------
Simply execute the given update_toolchain.sh script
.. code-block::

  ./update_toolchain.sh <version_to_install [atom/linux64]> <local qitoolchain>

This script will at first pull the git repository master's branch as specified in git remote -v
Then it executes a remove-package and add package as noted in detail below for manual execution
Parameters:
  1.) the first parameter is the name of the version you want to install.
      for now version for atom and linux64 are provided ( see the folders of this repo respectively ).
  2.) the name of the locally available toolchain. Run qitoolchain list for the names in doubt


Manual Update
-------------
Follow the following steps to include them into your existing toolchain

example given for the cross-toolchain here named "atom"

.. code-block::

  qitoolchain add-packages -c atom ros toolchain_install_atom.tar.gz

in your CMakeLists.txt you can use ROS now as you'd use boost

.. code-block::

  qi_use_lib(<lib_name> QI ROS)



Issues
======

libapr-1.so might be compiled against the wrong version libuuid.so and therefore complains about not finding a GENERATE_UUID symbol. If this is the case please check against which version of libuuid.so apr got compiled against.
In the VM there exists a /lib/libuuid.so.1 which is wrongly used. For now the system libuuid.so in /usr/lib is used, yet there is a version in the VM's external workspace to compile and link against a self-compiled version of it.
