#!/usr/bin/env cwl-runner

cwlVersion: v1.1
class: Workflow
inputs:
    input_dir: 
        type: Directory
    var_name: string
    bounding_box: string
    xres_arcsecs: int
    yres_arcsecs: int

outputs:
    configure_file:
        type: File
        outputSource: step2/config_file

steps:
    configure:
        run: step1.cwl
        in:
            input_dir: input_dir
            var_name: var_name
            bounding_box: bounding_box
            xres_arcsecs: xres_arcsecs
            yres_arcsecs: yres_arcsecs
        out: [config_file]
    step2:
        run: step2.cwl
        in: 
            configFile: configure/config_file
            dataDirectory: input_dir
        out: [config_file]
