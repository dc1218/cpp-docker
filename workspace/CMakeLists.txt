cmake_minimum_required(VERSION 3.10)  
  
project(echo)  
  
find_package(Boost REQUIRED COMPONENTS filesystem system thread)  
  
include_directories(${Boost_INCLUDE_DIRS})  
  
add_executable(echo main.cpp)  

target_link_libraries(echo ${Boost_LIBRARIES})