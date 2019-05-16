Linux + Makefile + Clang
------------------------

.. code-block:: none

  > polly.py --toolchain clang-cxx17 --verbose --config Release --fwd HUNTER_CONFIGURATION_TYPES=Release --jobs 8

.. code-block:: none

  > ./_builds/clang-cxx17-Release/demo

macOS + Makefile
----------------

.. code-block:: none

  > polly.py --toolchain osx-10-13-make-cxx14 --verbose --config Release --fwd HUNTER_CONFIGURATION_TYPES=Release --jobs 8

.. code-block:: none

  > ./_builds/osx-10-13-make-cxx14-Release/demo

macOS + Xcode
-------------

.. code-block:: none

  > polly.py --toolchain osx-10-13-cxx14 --verbose --config Release --fwd HUNTER_CONFIGURATION_TYPES=Release --jobs 8

.. code-block:: none

  > ./_builds/osx-10-13-cxx14/Release/demo

iOS + Xcode
-----------

.. code-block:: none

  > polly.py --toolchain ios-12-1-dep-9-3-arm64 --verbose --config Release --fwd HUNTER_CONFIGURATION_TYPES=Release --jobs 8 --open
