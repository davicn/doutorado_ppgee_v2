File: _AAREADME.txt
Database: TUH EEG Seizure Corpus (TUSZ)
Version: 1.5.1
-------------------------------------------------------------------------------

----
Change Log:

(20200329) the dev set and eval set were manually reviewed by multiple
	   annotators.
----

This file contains some basic statistics about the TUH EEG Seizure
Corpus, a corpus developed to motivate the development of high
performance seizure detection algorithms using machine learning. This
corpus is a subset of the TUH EEG Corpus and contains sessions that
are known to contain seizure events. To balance the corpus, some
sessions are provided that do not contain seizure events, so that the
false alarm performance of a system can be tested.

When you use this specific corpus in your research or technology
development, we ask that you reference the corpus using this
publication:

 Shah, V., von Weltin, E., Lopez. S., McHugh, J., Veloso, L.,
 Golmohammadi, M., Obeid, I., and Picone, J. (2018). The Temple University
 Hospital Seizure Detection Corpus. Frontiers in Neuroinformatics. 12:83.
 doi: 10.3389/fninf.2018.00083

This publication can be retrieved from:

https://www.isip.piconepress.com/publications/journals_refereed/2018/frontiers_neuroscience/tuh_eeg_seizure

Our preferred reference for the TUH EEG Corpus, from which this
seizure corpus was derived, is:

 Obeid, I., & Picone, J. (2016). The Temple University Hospital EEG
 Data Corpus. Frontiers in Neuroscience, Section Neural Technology,
 10, 196. http://doi.org/http://dx.doi.org/10.3389/fnins.2016.00196

v1.5.1 of the TUH EEG Seizure Corpus was based on v1.1.0 of the
TUH EEG Corpus.

There are two main directories in this release: dev and train. 
The train directory contains data you are allowed to use for the
development of your technology. The dev data is disjoint from the
training set and should only be used for testing.

There is also a blind evaluation set that we are reserving for open source
cmpetitions.

The top-level directories:

 edf/dev/01_tcp_ar
 edf/dev/02_tcp_le
 edf/dev/03_tcp_ar_a
 edf/train/01_tcp_ar
 edf/train/02_tcp_le
 edf/train/03_tcp_ar_a

refer to the appropriate channel configurations for the
EEGs. 01_tcp_ar refers to an AR reference configuration, with
annotations referencing a TCP format described below.

The pathname of a typical EEG file can be explained as follows:

 Filename:
  edf/dev/01_tcp_ar/002/00000258/s002_2003_07_21/00000258_s002_t000.edf

 Components:
  edf: contains the edf data

  dev: part of the dev_test set (vs.) train

  01_tcp_ar: data that follows the averaged reference (AR) configuration,
             while annotations use the TCP channel configutation

  002: a three-digit identifier meant to keep the number of subdirectories
       in a directory manageable. This follows the TUH EEG v1.1.0 convention.

  00000258: official patient number that is linked to v1.1.0 of TUH EEG

  s002_2003_07_21: session two (s002) for this patient. The session
                   was archived on 07/21/2003.

  00000258_s002_t000.edf: the actual EEG file. These are split into a series of
  			  files starting with t000.edf, t001.edf, ... These
			  represent pruned EEGs, so the original EEG is 
			  split into these segments, and uninteresting
			  parts of the original recording were deleted
			  (common in clinical practice).

The easiest way to access the annotations is through the spreadsheet
provided (_SEIZURES_*.xlsx). This contains the start and stop time
of each seizure event in an easy to understand format. Convert the
file to .csv if you need a machine-readable version.

There are six types of files in this release:

 *.edf:    the EEG sampled data in European Data Format (edf)
 *.txt:    the EEG report corresponding to the patient and session
 *.tse:    term-based annotations using all available seizure type classes
 *.tse_bi: same as *.tse except bi-class annotations (seizure/background) 
 *.lbl:    event-based annotations using all available seizure type classes
 *.lbl_bi: same as *.lbl except bi-class annotations (seizure/background)

Event-based annotations are per-channel. This means the annotation contains,
in addition to a start and stop time, a channel index. Seizures often can
be observed on one or more channels and then spread to other channels.
Event-based annotations capture this.

Term-based annotations use one label that applies to all channels. These
are most useful for machine learning research in which we tend to worry
only about the overall classification of a segment and are not concerned
about individual channels.

Bi-class annotations use two labels: seizure and background. The multi-class
annotations use all available seizure types. There are described in the
spreadsheet (_SEIZURES_*.xlsx).

Time-synchronous event (TSE) files use a simple format that looks like this:

 0.0000 490.0000 bckg 1.0000

The fields are: start time in secs, stop time in secs, label and probability
(by default, set to 1.0).

Label files (LBL) are more complicated and essentially describe a graph
that can represent a hierarchical annotation (e.g., FNSZ and GNSZ map to
SEIZ). They contain the start and stop times, a channel index, a level
index and probabilities for each class or symbol.

Clinical EEGs use a variety of channel configurations. In the larger
TUH EEG Corpus, there are over 40 different channel configurations. In
this subset, there are two type of EEGs: averaged reference (AR) and
linked ears reference (LE). Fortunately, all files in this subset
contain the standard channels you would expect from a 10/20
configuration, and all files can be converted to a TCP montage (which
is what we use internally for our processing).

What is somewhat confusing is that some patients have sessions listed
under both 01_tcp_ar and 02_tcp_le. There are 50 unique patients in
the development test set and 266 patients in the training set. But a find
command will return slightly higher numbers:

 find dev_test -mindepth 2 -maxdepth 2 | wc
     65      65    1570
 find train -mindepth 2 -maxdepth 2 | wc
     303     303    7675

because some patients appear in multiple montages:

 ls -1 -d */*/*/*/00002991
  edf/train/01_tcp_ar/029/00002991
  edf/train/02_tcp_le/029/00002991
  edf/train/03_tcp_ar_a/029/00002991
 ls -1 -d */*/*/*/00002297
  edf/dev/02_tcp_le/022/00002297
  edf/dev/03_tcp_ar_a/022/00002297

To learn more about this, please consult the following publication:

 Lopez, S., Gross, A., Yang, S., Golmohammadi, M., Obeid, I., &
 Picone, J. (2016). An Analysis of Two Common Reference Points for
 EEGs. In IEEE Signal Processing in Medicine and Biology Symposium
 (pp. 1???4). Philadelphia, Pennsylvania, USA. Available at:
 https://www.isip.piconepress.com/publications/conference_proceedings/2016/ieee_spmb/montages/.

The channel number in .lbl and .lbl_bi files refers to the channels
defined using a standard ACNS TCP montage. This is our preferred way
of viewing seizure data. The montage is defined as follows:

 montage =  0, FP1-F7: EEG FP1-REF --  EEG F7-REF
 montage =  1, F7-T3:  EEG F7-REF  --  EEG T3-REF
 montage =  2, T3-T5:  EEG T3-REF  --  EEG T5-REF
 montage =  3, T5-O1:  EEG T5-REF  --  EEG O1-REF
 montage =  4, FP2-F8: EEG FP2-REF --  EEG F8-REF
 montage =  5, F8-T4 : EEG F8-REF  --  EEG T4-REF
 montage =  6, T4-T6:  EEG T4-REF  --  EEG T6-REF
 montage =  7, T6-O2:  EEG T6-REF  --  EEG O2-REF
 montage =  8, A1-T3:  EEG A1-REF  --  EEG T3-REF
 montage =  9, T3-C3:  EEG T3-REF  --  EEG C3-REF
 montage = 10, C3-CZ:  EEG C3-REF  --  EEG CZ-REF
 montage = 11, CZ-C4:  EEG CZ-REF  --  EEG C4-REF
 montage = 12, C4-T4:  EEG C4-REF  --  EEG T4-REF
 montage = 13, T4-A2:  EEG T4-REF  --  EEG A2-REF
 montage = 14, FP1-F3: EEG FP1-REF --  EEG F3-REF
 montage = 15, F3-C3:  EEG F3-REF  --  EEG C3-REF
 montage = 16, C3-P3:  EEG C3-REF  --  EEG P3-REF
 montage = 17, P3-O1:  EEG P3-REF  --  EEG O1-REF
 montage = 18, FP2-F4: EEG FP2-REF --  EEG F4-REF
 montage = 19, F4-C4:  EEG F4-REF  --  EEG C4-REF
 montage = 20, C4-P4:  EEG C4-REF  --  EEG P4-REF
 montage = 21, P4-O2:  EEG P4-REF  --  EEG O2-REF

For example, channel 1 is a difference between electrodes F7 and T3,
and represents an arithmetic difference of the channels
(F7-REF)-(T3-REF), which are channels contained in the EDF file.
For files in the 02_tcp_le montage the channels are named as EEG P4-LE. All 
channel derivations are the same. 
For files in the 03_tcp_ar_a montage the derivations EEG A1-REF and 
EEG A2-REF are not included.

A spreadsheet is provided that classifies each seizure by type. This 
spreadsheet contains a legend that explains these fields.

Finally, here are some basic descriptive statistics about the data:

DEVELOPMENT SET (DEV)

total files: 1013
total sessions: 238
total patients: 50

files with seizures: 280
sessions with seizures: 104
patients with seizures: 40
total number of seizures: 673

total duration: 613,232.00 secs
total background duration: 554,786.89 secs (90.47%)
total duration of files with seizures: 230,031.00 secs (37.51%)
total seizure duration: 58,445.11 secs (9.53%)

-----------------------------

TRAINING SET (TRAIN)

total files: 4597
total sessions: 1185
total patients: 592

files with seizures: 867
sessions with seizures: 343
patients with seizures: 202
total number of seizures: 2,370

total duration: 2,708,284.00 secs
total background duration: 2,540,144,77 secs (93.79%)
total duration of files with seizures: 635,490.00 secs (23.46%)
total seizure duration: 168,139.23 secs (6.21%)

-----------------------------

If you have any additional comments or questions about the data,
please direct them to help@nedcdata.org.

Best regards,

Joe Picone
