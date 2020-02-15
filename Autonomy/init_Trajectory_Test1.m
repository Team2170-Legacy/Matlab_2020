Test1.x = [
   0.0...
   1.0...
   2
];

Test1.y = [0,0,0];

Test1.v = [.5 2];

Test1.distances = sub_traj_lengths(Test1);
Test1unique = 0;
Test1start = 0;
for Test1counter = 1:length(Test1.x) - 1
   Test1start = Test1.distances(Test1counter);
   if Test1.distances(Test1counter) ~= Test1.distances(Test1counter + 1)
       Test1unique = Test1unique + 1;
   end
end
Test1.subd = zeros(Test1unique);
for Test1counter = 1:length(Test1.x) - 1
   Test1start = Test1.distances(Test1counter);
   if Test1.distances(Test1counter) ~= Test1.distances(Test1counter + 1)
       
   end
end