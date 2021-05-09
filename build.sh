cmake \
    -DUSE_PANGOLIN_VIEWER=ON \
    -DINSTALL_PANGOLIN_VIEWER=ON \
    -DUSE_SOCKET_PUBLISHER=OFF \
    -DUSE_STACK_TRACE_LOGGER=ON \
    -DBUILD_TESTS=OFF \
    -DBUILD_EXAMPLES=ON \
    ..


./build/run_tum_rgbd_slam \
-v ./orb_vocab.fbow \
-d ../datasets/openloris/market-1-1/ \
-c example/openloris/openloris_market.yaml \
--frame-skip 1 \
--eval-log \
-p results/openloris/market1.msg


./build/run_openloris_localization \
-v ./orb_vocab.fbow \
-d ../datasets/openloris/market-1-1/ \
-c example/openloris/openloris_market.yaml \
--frame-skip 1 -p results/map_msg/market1.msg \
--mapping

export SPDLOG_LEVEL=debug


# 是否开mapping模块