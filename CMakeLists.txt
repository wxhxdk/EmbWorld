cmake_minimum_required(VERSION 3.16)

project(EmbWorld VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# ----------- Find Qt6 core modules ------------
find_package(Qt6 REQUIRED COMPONENTS Core Quick QuickControls2 Network)

# enable automoc / autouic / autorcc
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# ----------- Platform-specific flags ----------
if(ANDROID)
    # Basic Android settings
    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
    set(ANDROID_API_LEVEL 21)
    set(ANDROID_MIN_SDK_VERSION 21)
    set(ANDROID_TARGET_SDK_VERSION 33)
    # 设置 Java 版本以避免过时警告
    set(ANDROID_JAVA_SOURCE_COMPATIBILITY 11)
    set(ANDROID_JAVA_TARGET_COMPATIBILITY 11)
elseif(IOS)
    set(CMAKE_OSX_DEPLOYMENT_TARGET "11.0")
endif()

# ----------- Source files ---------------------
set(SOURCES
    src/main.cpp
    src/tabcontroller.cpp
)

set(HEADERS
    src/tabcontroller.h
)

qt_add_resources(RESOURCES resources.qrc)

# ----------- Create executable ----------------
if(ANDROID OR IOS)
    qt_add_executable(${PROJECT_NAME} ${SOURCES} ${HEADERS} ${RESOURCES})
    # Mobile-specific bundle settings
    if(IOS)
        set_target_properties(${PROJECT_NAME} PROPERTIES
            MACOSX_BUNDLE TRUE
        )
        if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/ios/Info.plist)
            set_target_properties(${PROJECT_NAME} PROPERTIES
                MACOSX_BUNDLE_INFO_PLIST ${CMAKE_CURRENT_SOURCE_DIR}/ios/Info.plist
            )
        endif()
    elseif(ANDROID)
        set_target_properties(${PROJECT_NAME} PROPERTIES
            ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android"
        )
    endif()
else()
    add_executable(${PROJECT_NAME} ${SOURCES} ${HEADERS} ${RESOURCES})
endif()

# ----------- Link Qt libs  --------------------
target_link_libraries(${PROJECT_NAME} PRIVATE
    Qt6::Core
    Qt6::Quick
    Qt6::QuickControls2
    Qt6::Network
)

target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/src)
