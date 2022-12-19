simSetSimulator "-vcssv" -exec \
           "/work/stu/dyzhang/projects/riosclass_zdy/verilog/dv/simv" -args \
           "2"
debImport "-dbdir" \
          "/work/stu/dyzhang/projects/riosclass_zdy/verilog/dv/simv.daidir"
debLoadSimResult /work/stu/dyzhang/projects/riosclass_zdy/verilog/dv/waves.fsdb
wvCreateWindow
srcHBSelect "hehe_tb.dram_u" -win $_nTrace1
srcSetScope -win $_nTrace1 "hehe_tb.dram_u" -delim "."
srcHBSelect "hehe_tb.dram_u" -win $_nTrace1
srcHBSelect "hehe_tb.hehe_u" -win $_nTrace1
srcSetScope -win $_nTrace1 "hehe_tb.hehe_u" -delim "."
srcHBSelect "hehe_tb.hehe_u" -win $_nTrace1
srcHBSelect "hehe_tb.hehe_u.core_u" -win $_nTrace1
srcSetScope -win $_nTrace1 "hehe_tb.hehe_u.core_u" -delim "."
srcHBSelect "hehe_tb.hehe_u.core_u" -win $_nTrace1
srcHBSelect "hehe_tb.hehe_u.core_u.hehe_backend" -win $_nTrace1
srcSetScope -win $_nTrace1 "hehe_tb.hehe_u.core_u.hehe_backend" -delim "."
srcHBSelect "hehe_tb.hehe_u.core_u.hehe_backend" -win $_nTrace1
srcHBSelect "hehe_tb.hehe_u.core_u.hehe_backend.backend_rcu" -win $_nTrace1
srcHBSelect "hehe_tb.hehe_u.core_u.hehe_backend.backend_rcu" -win $_nTrace1
srcSetScope -win $_nTrace1 "hehe_tb.hehe_u.core_u.hehe_backend.backend_rcu" \
           -delim "."
srcHBSelect "hehe_tb.hehe_u.core_u.hehe_backend.backend_rcu" -win $_nTrace1
srcSearchString "debug" -win $_nTrace1 -next -case
srcSearchString "debug" -win $_nTrace1 -next -case
srcSearchString "debug" -win $_nTrace1 -next -case
srcSearchString "debug" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "iss_debug_info" -line 320 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcSearchString "pc" -win $_nTrace1 -next -case
srcSearchString "pc" -win $_nTrace1 -next -case
srcSearchString "pc" -win $_nTrace1 -next -case
srcSearchString "rob_op_basic" -win $_nTrace1 -next -case
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 60279996.466174 -snap {("G2" 0)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvExpandBus -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 3 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 3 4 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 3 4 5 6 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 1)}
srcSearchString "pc_in" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "pc_in" -line 294 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
wvSetCursor -win $_nWave2 62789522.317565 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 49645268.163633 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 49639743.859032 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 49636429.276271 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 49683662.080615 -snap {("G2" 0)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 63636674.428228 -snap {("G1" 2)}
srcActiveTrace "hehe_tb.hehe_u.core_u.hehe_backend.backend_rcu.pc_in\[31:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 63570000 -TraceValue \
           10000000000000000000000001000000
wvSetCursor -win $_nWave2 63607948.044299 -snap {("G1" 1)}
srcActiveTrace "hehe_tb.hehe_u.core_u.hehe_backend.backend_rcu.iss_debug_info" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 63490000 -TraceValue 0
srcSearchString "iss_debug_info" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "iss_debug_info" -line 348 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
debExit
