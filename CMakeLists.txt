cmake_minimum_required(VERSION 3.16)
project(MyQMLApp VERSION 1.0 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick)

add_executable(MyQMLApp
    main.cpp
)

target_link_libraries(MyQMLApp
    PRIVATE Qt6::Core Qt6::Gui Qt6::Qml Qt6::Quick
)
