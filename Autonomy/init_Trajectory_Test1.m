Test1.x = [
   0.0...
   1.0...
   3
];

Test1.y = [0,0,0];

Test1.v = [.5 2];

Test1.name  = 'Test1';


 Test1.sub = sub_traj_lengths(Test1);
 Test1.tstamps = traj_timestamps_v002(Test1.sub, Test1.v);
 Test1.t_final   = Test1.tstamps(end);
 
 Test1.theta_start  = 0*deg;
 