# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(WARNING "Invoking generate_messages() without having added any message or service file before.
You should either add add_message_files() and/or add_service_files() calls or remove the invocation of generate_messages().")
message(STATUS "lqr_circle: 0 messages, 0 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Iyhs_can_msgs:/home/minipc/0FH/circle/src/yhs_can_msgs/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(lqr_circle_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_cpp(lqr_circle
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lqr_circle
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(lqr_circle_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(lqr_circle_generate_messages lqr_circle_generate_messages_cpp)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(lqr_circle_gencpp)
add_dependencies(lqr_circle_gencpp lqr_circle_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lqr_circle_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_eus(lqr_circle
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lqr_circle
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(lqr_circle_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(lqr_circle_generate_messages lqr_circle_generate_messages_eus)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(lqr_circle_geneus)
add_dependencies(lqr_circle_geneus lqr_circle_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lqr_circle_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_lisp(lqr_circle
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lqr_circle
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(lqr_circle_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(lqr_circle_generate_messages lqr_circle_generate_messages_lisp)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(lqr_circle_genlisp)
add_dependencies(lqr_circle_genlisp lqr_circle_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lqr_circle_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_nodejs(lqr_circle
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lqr_circle
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(lqr_circle_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(lqr_circle_generate_messages lqr_circle_generate_messages_nodejs)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(lqr_circle_gennodejs)
add_dependencies(lqr_circle_gennodejs lqr_circle_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lqr_circle_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services

### Generating Module File
_generate_module_py(lqr_circle
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lqr_circle
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(lqr_circle_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(lqr_circle_generate_messages lqr_circle_generate_messages_py)

# add dependencies to all check dependencies targets

# target for backward compatibility
add_custom_target(lqr_circle_genpy)
add_dependencies(lqr_circle_genpy lqr_circle_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lqr_circle_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lqr_circle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lqr_circle
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(lqr_circle_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(lqr_circle_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET yhs_can_msgs_generate_messages_cpp)
  add_dependencies(lqr_circle_generate_messages_cpp yhs_can_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lqr_circle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lqr_circle
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(lqr_circle_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(lqr_circle_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET yhs_can_msgs_generate_messages_eus)
  add_dependencies(lqr_circle_generate_messages_eus yhs_can_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lqr_circle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lqr_circle
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(lqr_circle_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(lqr_circle_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET yhs_can_msgs_generate_messages_lisp)
  add_dependencies(lqr_circle_generate_messages_lisp yhs_can_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lqr_circle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lqr_circle
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(lqr_circle_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(lqr_circle_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET yhs_can_msgs_generate_messages_nodejs)
  add_dependencies(lqr_circle_generate_messages_nodejs yhs_can_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lqr_circle)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lqr_circle\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lqr_circle
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(lqr_circle_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(lqr_circle_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET yhs_can_msgs_generate_messages_py)
  add_dependencies(lqr_circle_generate_messages_py yhs_can_msgs_generate_messages_py)
endif()
