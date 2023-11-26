# pes_sysarray
Systolic Array Matrix Multiplier implementation for ASIC Course by [Kunal Ghosh](https://github.com/kunalg123/) of the [VSD Group](https://www.vlsisystemdesign.com/).

### What is a Systolic Array?
A systolic array is a parallel processing architecture that consists of a network of tightly coupled processing elements (PEs) that perform computations on data as it flows through the array. The PEs are arranged in a regular grid and are connected to their nearest neighbors. Each PE performs a simple operation on its input data and then passes the result to its neighbors.

One of the advantages of systolic arrays is that they can achieve high throughput with relatively simple hardware. This is because the PEs are all performing the same operation on different data elements, which allows for pipelining and parallelism. Additionally, the systolic array architecture is very scalable, as the number of PEs can be increased to achieve even higher throughput.

![sys_array](https://github.com/skudlur/pes_sysarray/blob/main/sys_array.jpg)

### Systolic Array Architecture for Matrix Multiplication
A systolic array for matrix multiplication is a parallel processing architecture that uses a network of processing elements (PEs) to perform matrix multiplication in a pipelined fashion. The PEs are arranged in a regular grid and are connected to their nearest neighbors.

![matmul](https://github.com/skudlur/pes_sysarray/blob/main/matmul.gif)

### Benefits of Systolic Arrays
* Faster computation for algorithms that involve multiple primitive computation like matrix multiplication.
* Easily scalable and easy to verify functionality.

### Synthesis on Yosys for Gate level simulation (GLS)
```bash
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog systolic_array.v
synth -top systolic_array
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
write_verilog -noattr systolic_array_mapped.v
iverilog ../verilog_model/primitives.v ../verilog_model/sky130_fd_sc_hd.v systolic_array_mapped.v systolic_array_tb.v
./a.out
gtkwave wave.vcd
```

### RTL
![rtl](https://github.com/skudlur/pes_sysarray/blob/main/rtl.jpeg)

### Statistics
![stat](https://github.com/skudlur/pes_sysarray/blob/main/stats.jpeg)

### Pre-synthesis gate level simulation waveforms
![pre_syn](https://github.com/skudlur/pes_sysarray/blob/main/pre_syn.jpeg)

### Post-synthesis gate level simulation waveforms
![post_syn](https://github.com/skudlur/pes_sysarray/blob/main/post_syn.jpeg)

## Creating design folder through Openlane

To create a design folder with a default config.json file, follow the below command

```
cd
cd OpenLane
make mount
./flow.tcl -design <YOUR_DESIGN_NAME_HERE> -init_design_config
```

![image](https://github.com/skudlur/pes_sysarray/assets/38615795/4c9ca408-a3e5-49f2-93a2-f02da4519084)

The difference can be observed that openlane directory is created when you run this command for the first time where all your designs will be saved

In a new tab,

```
cd ~/OpenLane/openlane/<YOUR_DESIGN>
mkdir src
cd src
gedit <DESIGN_NAME>.v
```

Write verilog code for your design or paste it and save it

![image](https://github.com/skudlur/pes_sysarray/assets/38615795/1916a2d0-0f18-4413-ba01-257a92b72764)

The default config.json provided by openlane looks like this, add the path to the verilog file for the field VERILOG_FILES

![image](https://github.com/skudlur/pes_sysarray/assets/38615795/acc742c7-8c68-4620-919c-0f4392239806)

To complete the json file for a basic run, ie., with default flow configuration variables, add the path to verilog file ```dir::src/<DESIGN_NAME>.v```

The config.json should look similar to this

![image](https://github.com/skudlur/pes_sysarray/assets/38615795/e45a02d8-a162-4fc3-a116-8a809fea5093)

Now, we are ready to go

## Running a basic automated flow

- The errors encountered here helps to find the variables to be set in the ```config.json``` file inorder to resolve the error.
- The warning messages also gives an info of what extra variables to be defined in the json file
- By end of this automated flow without any error or flow related warnings after some iterations, You will have a proper populated config.json file
- This json file can be used to go on with interactive flow where you can change the variables in between the flow if required

The command to run the automated flow is 

```
./flow.tcl -design openlane/<YOUR_DESIGN_FLODER_NAME> -tag <ANY_NAME_FOR_EACH_RUN>
```

![image](https://github.com/skudlur/pes_sysarray/assets/38615795/1354dc29-66d4-4463-a43b-0921fbd9be1d)

Here we can observe a warning saying that the core area is too small and it set an area by itself. But we can specify the area by including the corresponding variable in the json file.

Some of the conditions for the design to work properly

- slack after synthesis should be as small as possible and a very small negative value such as -0.1 or below should be ok as after routing stage, the delay gets added and slack becomes positive
- if the design is core, then you may proceed with assigning more core utilisation upto 75%
- Make sure about the synthesis strategy

##### INFO

- The default variables that are used to run the deisgn can be viewed at ```OpenLane/openlane/runs/<SPECIFIC_RUN_FOLDER>/config.tcl```
- Once go through all the default values, paths etc used and decide on what to change for next run for the design to make it better
- The results regarding the slack can be found at ```OpenLane/openlane/runs/<SPECIFIC_RUN_FOLDER>/reports/synthesis```
 - AREA stat rpt has the statistics related to design area and cells used in synthesis
 - sta summary has the slack details
- The results related to die area and core area can be obtained at ```OpenLane/openlane/runs/<SPECIFIC_RUN_FOLDER>/reports/floorplan```
 - core area file has the co-ordinates of the core ```(x0 y0 x1 y1)``` bottom left corner, top right corner co ordinates
 - Die area file has the co-ordinates of Die
 - Module area in the synthesis folder observed will almost be half of the core area (x1-x0 * y1-y0). This is because the default core utilisation is 50%
 - Make it less by changing the co-ordinates of core area using the corresponding variable with a utilisation percent in target
 - core util = module area / core area

 Similarly explore all the other folders inside the <SPECIFIC_RUN_FOLDER>.

### Config.json

Once all the above suggestions are followed, the config.json for my file looks something like this but you may have different variables according to your design

- The cap load can be seen at the input pin of the driving cell defined in the library corresponding to ```LIB_SYNTH_COMPLETE```

![image](https://github.com/skudlur/pes_sysarray/assets/38615795/a1cab6a6-9615-4f73-b947-f2530c6078b6)

## Interactive flow 

The variables that can be changed for particular step of interactive flow can be found at ```OpenLane/configuratons``` in the form of <STAGE>.tcl

1. **Initiate the interactive flow** - ```./flow.tcl -interactive```
2. **prepare the design for the flow** - ```prep -design openlane/<DESIGN_FOLDER_NAME> -tag <RUN_NAME>```

![image](https://github.com/skudlur/pes_sysarray/assets/38615795/9545efa6-1783-46c0-832a-1df4403b15da)

3. **Run Synthesis** - ```run_synthesis```

![image](https://github.com/skudlur/pes_sysarray/assets/38615795/3959f5ac-9f30-42ca-9247-63b7a58cb580)


- The area statistics results can be found at ```results/synthesis```
- The static timing analysis (slack) results can be seen at the bottom of ```logs/synthesis/2-sta.summary.rpt```

### NOTE

1. ##### If the slack is highly negative -0.1, -0.05, 0 etc proceed to next steps from run_floorplan
2. ##### If the slack is just positive, then continue with next steps from run_floorplan
3. ##### If the slack is higly positive, Greater than 2 then you have a scope to decrease the clock period and run again so that freqency increases.
4. ##### If the slack is -0.4 , 0.5 or lower, then increase the clock period
5. ##### If the slack is -0.4 to 0 then instead of directly increasing the clock period, try some OpenSTA optimisations so that we get positive slack at same frequency.

Here We have 2 ways to go
1. OpenSTA
2. Proceed with further flow from run_floorplan

### OpenSTA

We here do pre-STA analsysis where we 
- replace the cells that have more fanout to a cell with cell fanout
- replace the cell contributing to more delay with a cell that decreases it by a larger verion of it with same functionality
- check the slack for every action taken
- stop the process once the slack is either point 1 or 2 under the NOTE
- replace the synthesized verilog file with the sta operated verilog file
- proceed with main floe from run_floorplan

The process requires 
- OpenSTA - ```sudo apt install opensta```
- a config file for sta
- a base.sdc file that defines the constraints

#### Config file for STA

- create a file pre_sta.conf in ```OpenLane/openlane``` with the content

```
set_cmd_units -time ns -capacitance pF -current mA -voltage V -resistance kOhm -distance um
read_liberty -max /home/yagna/.volare/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ss_100C_1v60.lib
read_liberty -min /home/yagna/.volare/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ff_n40C_1v95.lib
read_liberty -nom /home/yagna/.volare/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog /home/yagna/OpenLane/openlane/PES_ADD_SUB_32/runs/RUN1_INTER/results/synthesis/PES_ADD_SUB_32.v
link_design PES_ADD_SUB_32
read_sdc /home/yagna/OpenLane/openlane/PES_ADD_SUB_32/src/my_base.sdc
report_checks -path_delay min_max -fields {slew trans net cap input_pin}
report_tns
report_wns
```

- max library is the library corresponding to the path present at ```LIB_SLOWEST``` in the config.tcl file present in the runs/<SPECIFIC_RUN_FOLDER>
- min library is the library corresponding to the path present at ```LIB_FASTEST```
- nom library is the library corresponding to the path present at ```LIB_SYNTH_COMPLETE```
- my_base.sdc to be created in ```src``` folder with the content present at ```OpenLane/scripts/base.sdc``` and set the environment variables mentioned in ```base.sdc```

Comparision between base.sdc and my_base.sdc

![image](https://github.com/skudlur/pes_sysarray/assets/38615795/d82c3b40-f7fa-4995-868b-2b8c8c362ec2)

#### OpenSTA Flow

Go to the directory where pre_sta.conf is present and run ```sta pre_sta.conf```

The  Hold slack has met the requirement 

![image](https://github.com/skudlur/pes_sysarray/assets/38615795/72065603-a1ff-405f-9abc-04248f9efd99)

##### STEP 1 : Decrease the Fanout - I did it to 4 

To the config.json file, add the line ```"MAX_FANOUT_CONSTRAINT": 4``` after the clock period variable and again start interactive flow from start, prepare design and overwrite the run, run_synthesis and then run the sta part

![image](https://github.com/skudlur/pes_sysarray/assets/38615795/80c3f45d-4f9d-49cd-8ff1-49e27bb3ccf0)

##### STEP 2 : Replace cells that infer larger delay

In the above figure we can observe that cell instance **493** is causing the most delay. So we have to replace it with larger version of itself

```report_net -connections _020_``` - instances being driven by net _020_ as in fig

The instance that's causing highest delay is the cell **493**. So replace it as mentioned and check the result

```
replace_cell _493_ sky130_fd_sc_hd__or2b_4
report_checks -path_delay min_max -fields {slew trans net cap input_pin}
```

Repeat this till the slack reaches almost positive value or a minimum positive value

Once the slack is met, since the synthesized netlist has been manually modified, we have to write this out as a veriog file and replace it with the verilog file under ```results/synthesis``` with the same name so that the next steps consider this as the openlane synthesized netlist

```
write_verilog /home/zer0/Documents/OpenLane/openlane/pes_sysarray/runs/RUN1_INT/results/synthesis/pes_sysarray.v
```

Exit STA and continue with the main Openlane flow

4. **Run Floorplan** - ```run_floorplan```

![image](https://github.com/skudlur/pes_sysarray/assets/38615795/35d64ab7-fd2a-4520-a49f-a5094a62a133)

To view Floorplan in magic
```
cd /home/zer0/Documents/OpenLane/openlane/pes_sysarray/runs/RUN1_INT/results/floorplan
magic -T /home/zer0/Documents/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.nom.lef def read pes_sysarray.def &
```

change the paths accordingly for the runs and hostname

![image](https://github.com/skudlur/pes_sysarray/assets/38615795/8b8107a0-384f-4dca-8871-f64834b749ba)

5. **Run Placement** - ```run_placement```

![image](https://github.com/skudlur/pes_sysarray/assets/38615795/373b0b5e-f17c-41be-a546-f79cd73c579b)

A snapshot of placement 

![image](https://github.com/skudlur/pes_sysarray/assets/38615795/4b8a7cfa-9674-407c-ad8f-0201b6fea56c)

Execute the same magic command as in floorplan stage but this time in ```results/placement``` folder

6. **Run CTS** - ```run_cts```

![image](https://github.com/skudlur/pes_sysarray/assets/38615795/d08c2a80-dfa3-402f-ab0c-4561d0200fdc)

- The last 3 commands just shows that we can change the variable values in the interactive mode and continue with the flow
- ```echo``` is to check and ```set``` is to assign

POWER AREA AND TIMING REPORT

![image](https://github.com/skudlur/pes_sysarray/assets/38615795/ad3d9f2b-b81e-43c0-b9f3-f6244ff7b6ae)

![image](https://github.com/skudlur/pes_sysarray/assets/38615795/fac70109-45af-4ca0-ad40-4d0bdfea0313)

![image](https://github.com/skudlur/pes_sysarray/assets/38615795/a2b93cc8-8790-440a-9209-58e37421ed45)

![image](https://github.com/skudlur/pes_sysarray/assets/38615795/5f2e013d-4eba-4a10-9975-4680bdd6c2cb)

![image](https://github.com/skudlur/pes_sysarray/assets/38615795/725b8b19-55f4-432f-a8da-a0c3c369520a)


7. **Generate Power Distribution Network** - ```gen_pdn```

![image](https://github.com/skudlur/pes_sysarray/assets/38615795/f175c601-81cb-476f-b306-6f7994256ec1)

8. **Run Routing** - ```run_routing```

![image](https://github.com/skudlur/pes_sysarray/assets/38615795/59de952a-3b2f-4ecb-8190-94b1c17d8e32)

For further steps follow [interactive mode steps](https://openlane.readthedocs.io/en/latest/reference/interactive_mode.html)
