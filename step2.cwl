#!/usr/bin/env cwl-runner

cwlVersion: v1.1
class: CommandLineTool
baseCommand: cat 
inputs:
  configFile:
    type: File
    inputBinding:
      position: 1
  dataDirectory:
    type: Directory

outputs:
  config_file:
    type: stdout