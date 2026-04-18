#!/bin/bash

xhost +

byobu new-session -d -s wros2_robotiqhe_obstcl
byobu select-pane -t 0
byobu split-window -v

byobu send-keys -t 0 'docker exec -it wros2_jazzy_container bash -c "source /opt/ros/jazzy/setup.bash && source /ros2_ws/install/setup.bash && ros2 launch wros2_tutorials plan_grasp_launch.py config:=planner_params_robotiqhe_obstcl_example.yaml"' 'C-m'
sleep 3
byobu send-keys -t 1 'docker exec -it wros2_jazzy_container bash -c "source /opt/ros/jazzy/setup.bash && source /ros2_ws/install/setup.bash && ros2 service call /plan_grasp std_srvs/srv/Empty"' 'C-m'

byobu attach -t wros2_robotiqhe_obstcl
