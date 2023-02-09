#!/usr/bin/env nextflow

//---------------------------------------
// include the RNA seq workflow
//---------------------------------------

include { longRna } from  './modules/longReadRnaSeq.nf'


//---------------------------------------------------------------
// Param Checking 
//---------------------------------------------------------------


if(!params.referenceAnnotation) {
    throw new Exception("Missing parameter params.referenceAnnotation")
  }
if(!params.reference) {
    throw new Exception("Missing parameter params.reference")
  }

if(!params.reads) {
    throw new Exception("Missing parameter params.reads")
  }

if(!params.platform) {
    throw new Exception("Missing parameter params.platform")
  }

if(!params.build) {
    throw new Exception("Missing parameter params.build")
  }

if(!params.annotationName) {
    throw new Exception("Missing parameter params.annotationName")
  }
if(!params.results) {
    throw new Exception("Missing parameter params.results")
  }


reads_ch = Channel.fromPath([params.reads + '/*.fastq', params.reads + '/*.fastq.gz', params.reads + '/*.fq.gz'])

//--------------------------------------
// Process the workflow
//-------------------------------------

workflow {
    longRna(reads_ch)
}