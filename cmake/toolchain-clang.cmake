
include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG("-std=c++1y" COMPILER_SUPPORTS_CXX1Y)
CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
CHECK_CXX_COMPILER_FLAG("-std=c++0x" COMPILER_SUPPORTS_CXX0X)

IF(COMPILER_SUPPORTS_CXX1Y)
	# Enable the newest version
	set(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} "-std=c++1y")
ELSEIF(COMPILER_SUPPORTS_CXX11)
	# C++11 should be supported
	set(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} "-std=c++11")
ELSEIF(COMPILER_SUPPORTS_CXX0X)
	# Maybe C++0X works?
	set(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} "-std=c++0x")
ELSE(COMPILER_SUPPORTS_CXX1Y)
	MESSAGE(ERROR "This project requires C++11 support but your compiler does not support it!")
ENDIF(COMPILER_SUPPORTS_CXX1Y)
