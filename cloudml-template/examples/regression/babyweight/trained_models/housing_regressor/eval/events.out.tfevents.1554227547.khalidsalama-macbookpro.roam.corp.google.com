       ?K"	  ?V?(?Abrain.Event:26????     =??	4?V?(?A"??

global_step/Initializer/zerosConst*
dtype0	*
_output_shapes
: *
value	B	 R *
_class
loc:@global_step
?
global_step
VariableV2*
	container *
shape: *
dtype0	*
_output_shapes
: *
shared_name *
_class
loc:@global_step
?
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
validate_shape(*
_output_shapes
: *
use_locking(*
T0	*
_class
loc:@global_step
j
global_step/readIdentityglobal_step*
_output_shapes
: *
T0	*
_class
loc:@global_step
?
tensors/component_0Const"/device:CPU:0**
value!BBdata/eval-data-01.csv*
dtype0*
_output_shapes
:
]
cycle_lengthConst"/device:CPU:0*
value	B	 R*
dtype0	*
_output_shapes
: 
]
block_lengthConst"/device:CPU:0*
value	B	 R*
dtype0	*
_output_shapes
: 
W
sloppyConst"/device:CPU:0*
value	B
 Z*
dtype0
*
_output_shapes
: 
g
buffer_output_elementsConst"/device:CPU:0*
value	B	 R*
dtype0	*
_output_shapes
: 
h
prefetch_input_elementsConst"/device:CPU:0*
value	B	 R*
dtype0	*
_output_shapes
: 
\

batch_sizeConst"/device:CPU:0*
value
B	 R?*
dtype0	*
_output_shapes
: 
_
drop_remainderConst"/device:CPU:0*
value	B
 Z *
dtype0
*
_output_shapes
: 
e
buffer_sizeConst"/device:CPU:0*
dtype0	*
_output_shapes
: *
valueB	 R
?????????
?
optimizationsConst*V
valueMBKBmap_and_batch_fusionBnoop_eliminationBshuffle_and_repeat_fusion*
dtype0*
_output_shapes
:
?

IteratorV2
IteratorV2*
_output_shapes
: *
	container *
output_types
2
*
shared_name *?
output_shapes?
?:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????
?
TensorSliceDatasetTensorSliceDatasettensors/component_0*
output_shapes
: *
Toutput_types
2*
_class
loc:@IteratorV2*
_output_shapes
: 
?
%ExperimentalParallelInterleaveDataset%ExperimentalParallelInterleaveDatasetTensorSliceDatasetcycle_lengthblock_lengthsloppybuffer_output_elementsprefetch_input_elements*
_output_shapes
: *'
output_shapes
: : : : : : : : : : *
_class
loc:@IteratorV2*J
fERC
Atf_data_experimental_parallel_interleave_filename_to_dataset_2578*
output_types
2
*

Targuments
 
?
BatchDatasetV2BatchDatasetV2%ExperimentalParallelInterleaveDataset
batch_sizedrop_remainder*
_output_shapes
: *
output_types
2
*?
output_shapes?
?:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
_class
loc:@IteratorV2
?

MapDataset
MapDatasetBatchDatasetV2* 
fR
Dataset_map_map_fn_2606*
use_inter_op_parallelism( *
output_types
2
*

Targuments
 *
_output_shapes
: *
preserve_cardinality( *?
output_shapes?
?:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
_class
loc:@IteratorV2
?
PrefetchDatasetPrefetchDataset
MapDatasetbuffer_size*
output_types
2
*?
output_shapes?
?:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
_class
loc:@IteratorV2*
_output_shapes
: 
?
MapDataset_1
MapDatasetPrefetchDataset*
_output_shapes
: *
preserve_cardinality( *?
output_shapes?
?:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
_class
loc:@IteratorV2*"
fR
Dataset_map_<lambda>_2619*
output_types
2
*
use_inter_op_parallelism(*

Targuments
 
?
OptimizeDatasetOptimizeDatasetMapDataset_1optimizations*?
output_shapes?
?:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
_class
loc:@IteratorV2*
_output_shapes
: *
output_types
2

?
ModelDatasetModelDatasetOptimizeDataset*
_output_shapes
: *
output_types
2
*?
output_shapes?
?:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
_class
loc:@IteratorV2
U
MakeIteratorMakeIteratorModelDataset
IteratorV2*
_class
loc:@IteratorV2
T
IteratorToStringHandleIteratorToStringHandle
IteratorV2*
_output_shapes
: 
?
IteratorGetNextIteratorGetNext
IteratorV2*?
_output_shapes?
?:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
output_types
2
*?
output_shapes?
?:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????
c
ExponentialDecay/learning_rateConst*
valueB
 *o?:*
dtype0*
_output_shapes
: 
Z
ExponentialDecay/Cast/xConst*
value
B :?*
dtype0*
_output_shapes
: 
v
ExponentialDecay/CastCastExponentialDecay/Cast/x*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
^
ExponentialDecay/Cast_1/xConst*
valueB
 *  ??*
dtype0*
_output_shapes
: 
q
ExponentialDecay/Cast_2Castglobal_step/read*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0
t
ExponentialDecay/truedivRealDivExponentialDecay/Cast_2ExponentialDecay/Cast*
T0*
_output_shapes
: 
q
ExponentialDecay/PowPowExponentialDecay/Cast_1/xExponentialDecay/truediv*
T0*
_output_shapes
: 
n
ExponentialDecayMulExponentialDecay/learning_rateExponentialDecay/Pow*
T0*
_output_shapes
: 
`
learning_rate/tagsConst*
valueB Blearning_rate*
dtype0*
_output_shapes
: 
e
learning_rateScalarSummarylearning_rate/tagsExponentialDecay*
T0*
_output_shapes
: 
?
|dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/shapeConst*
valueB"      *l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
:
?
{dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/meanConst*
valueB
 *    *l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
}dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddevConst*
valueB
 *?5?*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormalTruncatedNormal|dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/shape*
dtype0*
_output_shapes

:*
seedޱ?	*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
seed2'
?
zdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/mulMul?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormal}dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddev*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
_output_shapes

:
?
vdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normalAddzdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/mul{dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/mean*
_output_shapes

:*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0
?
Ydnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0
VariableV2*
shared_name *l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
	container *
shape
:*
dtype0*
_output_shapes

:
?
`dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/AssignAssignYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0vdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal*
use_locking(*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
validate_shape(*
_output_shapes

:
?
^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/readIdentityYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
_output_shapes

:
?
~dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/shapeConst*
dtype0*
_output_shapes
:*
valueB"      *n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0
?
}dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/meanConst*
dtype0*
_output_shapes
: *
valueB
 *    *n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0
?
dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddevConst*
valueB
 *?5?*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormalTruncatedNormal~dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/shape*
dtype0*
_output_shapes

:*
seedޱ?	*
T0*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
seed20
?
|dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/mulMul?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormaldnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddev*
T0*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
_output_shapes

:
?
xdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normalAdd|dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/mul}dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/mean*
T0*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
_output_shapes

:
?
[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0
VariableV2*
	container *
shape
:*
dtype0*
_output_shapes

:*
shared_name *n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0
?
bdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/AssignAssign[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0xdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal*
use_locking(*
T0*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
validate_shape(*
_output_shapes

:
?
`dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/readIdentity[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
T0*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
_output_shapes

:
?
xdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/shapeConst*
valueB"      *h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
:
?
wdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/meanConst*
valueB
 *    *h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
ydnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddevConst*
valueB
 *?5?*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormalTruncatedNormalxdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/shape*
dtype0*
_output_shapes

:*
seedޱ?	*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
seed29
?
vdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/mulMul?dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormalydnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddev*
_output_shapes

:*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0
?
rdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normalAddvdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/mulwdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/mean*
_output_shapes

:*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0
?
Udnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0
VariableV2*
	container *
shape
:*
dtype0*
_output_shapes

:*
shared_name *h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0
?
\dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/AssignAssignUdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0rdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal*
use_locking(*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
validate_shape(*
_output_shapes

:
?
Zdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/readIdentityUdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
_output_shapes

:*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0
?
dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal/shapeConst*
dtype0*
_output_shapes
:*
valueB"      *o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0
?
~dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal/meanConst*
valueB
 *    *o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddevConst*
valueB
 *?5?*o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormalTruncatedNormaldnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal/shape*
T0*o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
seed2B*
dtype0*
_output_shapes

:*
seedޱ?	
?
}dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal/mulMul?dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormal?dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddev*
T0*o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
_output_shapes

:
?
ydnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normalAdd}dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal/mul~dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal/mean*
_output_shapes

:*
T0*o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0
?
\dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0
VariableV2*
shared_name *o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
	container *
shape
:*
dtype0*
_output_shapes

:
?
cdnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/AssignAssign\dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0ydnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal*
T0*o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
validate_shape(*
_output_shapes

:*
use_locking(
?
adnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/readIdentity\dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
T0*o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
_output_shapes

:
?
|dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/shapeConst*
valueB"      *l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
:
?
{dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/meanConst*
valueB
 *    *l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
}dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddevConst*
valueB
 *   ?*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormalTruncatedNormal|dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/shape*
dtype0*
_output_shapes

:*
seedޱ?	*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
seed2K
?
zdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/mulMul?dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormal}dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddev*
_output_shapes

:*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0
?
vdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normalAddzdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/mul{dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/mean*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
_output_shapes

:
?
Ydnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0
VariableV2*
shared_name *l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
	container *
shape
:*
dtype0*
_output_shapes

:
?
`dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/AssignAssignYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0vdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
validate_shape(*
_output_shapes

:*
use_locking(
?
^dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/readIdentityYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
_output_shapes

:
?
Odnn/input_from_feature_columns/input_layer/alcohol_use_embedding/ExpandDims/dimConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
?
Kdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/ExpandDims
ExpandDimsIteratorGetNextOdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/ExpandDims/dim*

Tdim0*
T0*'
_output_shapes
:?????????
?
_dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/ignore_value/xConst*
dtype0*
_output_shapes
: *
valueB B 
?
Ydnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/NotEqualNotEqualKdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/ExpandDims_dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/ignore_value/x*
T0*'
_output_shapes
:?????????
?
Xdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/indicesWhereYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/NotEqual*
T0
*'
_output_shapes
:?????????
?
Wdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/valuesGatherNdKdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/ExpandDimsXdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/indices*
Tindices0	*
Tparams0*#
_output_shapes
:?????????
?
\dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/dense_shapeShapeKdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/ExpandDims*
T0*
out_type0	*
_output_shapes
:
?
Ydnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/ConstConst*&
valueBBTrueBFalseBNone*
dtype0*
_output_shapes
:
?
Xdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/SizeConst*
dtype0*
_output_shapes
: *
value	B :
?
_dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
?
_dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
?
Ydnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/rangeRange_dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/range/startXdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/Size_dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/range/delta*
_output_shapes
:*

Tidx0
?
[dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/ToInt64CastYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/range*
Truncate( *
_output_shapes
:*

DstT0	*

SrcT0
?
ddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/hash_table/ConstConst*
valueB	 R
?????????*
dtype0	*
_output_shapes
: 
?
^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/hash_tableHashTableV2*
shared_name *
use_node_name_sharing( *
	key_dtype0*
	container *
value_dtype0	*
_output_shapes
: 
?
idnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/hash_table/table_initLookupTableImportV2^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/hash_tableYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/Const[dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/ToInt64*	
Tin0*

Tout0	
?
Rdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/hash_table_LookupLookupTableFindV2^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/hash_tableWdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/valuesddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/hash_table/Const*#
_output_shapes
:?????????*	
Tin0*

Tout0	
?
jdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:
?
idnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
?
ddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SliceSlice\dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/dense_shapejdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice/beginidnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice/size*
Index0*
T0	*
_output_shapes
:
?
ddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/ConstConst*
valueB: *
dtype0*
_output_shapes
:
?
cdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/ProdProdddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Sliceddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Const*
T0	*
_output_shapes
: *
	keep_dims( *

Tidx0
?
odnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2/indicesConst*
dtype0*
_output_shapes
: *
value	B :
?
ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
gdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2GatherV2\dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/dense_shapeodnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2/indicesldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2/axis*
Tparams0	*
_output_shapes
: *
Taxis0*
Tindices0
?
ednn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Cast/xPackcdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Prodgdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2*
T0	*

axis *
N*
_output_shapes
:
?
ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseReshapeSparseReshapeXdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/indices\dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/dense_shapeednn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Cast/x*-
_output_shapes
:?????????:
?
udnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseReshape/IdentityIdentityRdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/hash_table_Lookup*#
_output_shapes
:?????????*
T0	
?
mdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
?
kdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GreaterEqualGreaterEqualudnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseReshape/Identitymdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GreaterEqual/y*
T0	*#
_output_shapes
:?????????
?
ddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/WhereWherekdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GreaterEqual*
T0
*'
_output_shapes
:?????????
?
ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape/shapeConst*
valueB:
?????????*
dtype0*
_output_shapes
:
?
fdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/ReshapeReshapeddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Whereldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape/shape*#
_output_shapes
:?????????*
T0	*
Tshape0
?
ndnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 
?
idnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2_1GatherV2ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseReshapefdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshapendnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2_1/axis*'
_output_shapes
:?????????*
Taxis0*
Tindices0	*
Tparams0	
?
ndnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2_2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
?
idnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2_2GatherV2udnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseReshape/Identityfdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshapendnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2_2/axis*
Taxis0*
Tindices0	*
Tparams0	*#
_output_shapes
:?????????
?
gdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/IdentityIdentityndnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseReshape:1*
T0	*
_output_shapes
:
?
xdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 
?
?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsidnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2_1idnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2_2gdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Identityxdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:?????????:?????????:?????????:?????????
?
?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlice?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
Index0*
T0	*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*#
_output_shapes
:?????????
?
{dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/CastCast?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *#
_output_shapes
:?????????*

DstT0
?
}dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/UniqueUnique?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*2
_output_shapes 
:?????????:?????????*
out_idx0*
T0	
?
?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/axisConst*
dtype0*
_output_shapes
: *
value	B : *l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0
?
?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/embedding_lookupGatherV2^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/read}dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/Unique?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/axis*
Tindices0	*
Tparams0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*'
_output_shapes
:?????????*
Taxis0
?
?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentity?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:?????????
?
vdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparseSparseSegmentMean?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identitydnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/Unique:1{dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/Cast*
T0*'
_output_shapes
:?????????*

Tidx0
?
ndnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape_1/shapeConst*
valueB"????   *
dtype0*
_output_shapes
:
?
hdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape_1Reshape?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:2ndnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape_1/shape*'
_output_shapes
:?????????*
T0
*
Tshape0
?
ddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/ShapeShapevdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
?
rdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
?
tdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
?
tdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_sliceStridedSliceddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Shaperdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_slice/stacktdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_slice/stack_1tdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_slice/stack_2*
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask 
?
fdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
?
ddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/stackPackfdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/stack/0ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_slice*
T0*

axis *
N*
_output_shapes
:
?
cdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/TileTilehdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape_1ddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/stack*

Tmultiples0*
T0
*0
_output_shapes
:??????????????????
?
idnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/zeros_like	ZerosLikevdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
?
^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weightsSelectcdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Tileidnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/zeros_likevdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
?
ednn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Cast_1Cast\dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/dense_shape*

SrcT0	*
Truncate( *
_output_shapes
:*

DstT0
?
ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:
?
kdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
?
fdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_1Sliceednn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Cast_1ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_1/beginkdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_1/size*
Index0*
T0*
_output_shapes
:
?
fdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Shape_1Shape^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights*
T0*
out_type0*
_output_shapes
:
?
ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:
?
kdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_2/sizeConst*
valueB:
?????????*
dtype0*
_output_shapes
:
?
fdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_2Slicefdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Shape_1ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_2/beginkdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_2/size*
Index0*
T0*
_output_shapes
:
?
jdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
ednn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/concatConcatV2fdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_1fdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_2jdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
?
hdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape_2Reshape^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weightsednn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/concat*'
_output_shapes
:?????????*
T0*
Tshape0
?
Fdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/ShapeShapehdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape_2*
T0*
out_type0*
_output_shapes
:
?
Tdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
?
Vdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
Vdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
Ndnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_sliceStridedSliceFdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/ShapeTdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_slice/stackVdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_slice/stack_1Vdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
?
Pdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/Reshape/shape/1Const*
dtype0*
_output_shapes
: *
value	B :
?
Ndnn/input_from_feature_columns/input_layer/alcohol_use_embedding/Reshape/shapePackNdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_slicePdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:
?
Hdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/ReshapeReshapehdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape_2Ndnn/input_from_feature_columns/input_layer/alcohol_use_embedding/Reshape/shape*'
_output_shapes
:?????????*
T0*
Tshape0
?
Qdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/ExpandDims/dimConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
?
Mdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/ExpandDims
ExpandDimsIteratorGetNext:1Qdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/ExpandDims/dim*

Tdim0*
T0*'
_output_shapes
:?????????
?
adnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/ignore_value/xConst*
valueB B *
dtype0*
_output_shapes
: 
?
[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/NotEqualNotEqualMdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/ExpandDimsadnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/ignore_value/x*
T0*'
_output_shapes
:?????????
?
Zdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/indicesWhere[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/NotEqual*
T0
*'
_output_shapes
:?????????
?
Ydnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/valuesGatherNdMdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/ExpandDimsZdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/indices*
Tparams0*#
_output_shapes
:?????????*
Tindices0	
?
^dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/dense_shapeShapeMdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/ExpandDims*
T0*
out_type0	*
_output_shapes
:
?
]dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/ConstConst*&
valueBBTrueBFalseBNone*
dtype0*
_output_shapes
:
?
\dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/SizeConst*
value	B :*
dtype0*
_output_shapes
: 
?
cdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
?
cdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
]dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/rangeRangecdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/range/start\dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/Sizecdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/range/delta*

Tidx0*
_output_shapes
:
?
_dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/ToInt64Cast]dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/range*
Truncate( *
_output_shapes
:*

DstT0	*

SrcT0
?
hdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/hash_table/ConstConst*
valueB	 R
?????????*
dtype0	*
_output_shapes
: 
?
bdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/hash_tableHashTableV2*
value_dtype0	*
_output_shapes
: *
shared_name *
use_node_name_sharing( *
	key_dtype0*
	container 
?
mdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/hash_table/table_initLookupTableImportV2bdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/hash_table]dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/Const_dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/ToInt64*	
Tin0*

Tout0	
?
Tdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/hash_table_LookupLookupTableFindV2bdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/hash_tableYdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/valueshdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/hash_table/Const*#
_output_shapes
:?????????*	
Tin0*

Tout0	
?
ndnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:
?
mdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
?
hdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SliceSlice^dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/dense_shapendnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice/beginmdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice/size*
Index0*
T0	*
_output_shapes
:
?
hdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/ConstConst*
valueB: *
dtype0*
_output_shapes
:
?
gdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/ProdProdhdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slicehdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Const*
	keep_dims( *

Tidx0*
T0	*
_output_shapes
: 
?
sdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2/indicesConst*
value	B :*
dtype0*
_output_shapes
: 
?
pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
kdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2GatherV2^dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/dense_shapesdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2/indicespdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2/axis*
_output_shapes
: *
Taxis0*
Tindices0*
Tparams0	
?
idnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Cast/xPackgdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Prodkdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2*
T0	*

axis *
N*
_output_shapes
:
?
pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseReshapeSparseReshapeZdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/indices^dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/dense_shapeidnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Cast/x*-
_output_shapes
:?????????:
?
ydnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseReshape/IdentityIdentityTdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/hash_table_Lookup*
T0	*#
_output_shapes
:?????????
?
qdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
?
odnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GreaterEqualGreaterEqualydnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseReshape/Identityqdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GreaterEqual/y*
T0	*#
_output_shapes
:?????????
?
hdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/WhereWhereodnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GreaterEqual*
T0
*'
_output_shapes
:?????????
?
pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape/shapeConst*
valueB:
?????????*
dtype0*
_output_shapes
:
?
jdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/ReshapeReshapehdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Wherepdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:?????????
?
rdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
mdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2_1GatherV2pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseReshapejdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshaperdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2_1/axis*'
_output_shapes
:?????????*
Taxis0*
Tindices0	*
Tparams0	
?
rdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
mdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2_2GatherV2ydnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseReshape/Identityjdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshaperdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2_2/axis*
Tindices0	*
Tparams0	*#
_output_shapes
:?????????*
Taxis0
?
kdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/IdentityIdentityrdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseReshape:1*
_output_shapes
:*
T0	
?
|dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsmdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2_1mdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2_2kdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Identity|dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:?????????:?????????:?????????:?????????
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlice?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*#
_output_shapes
:?????????*
Index0*
T0	
?
dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/CastCast?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/strided_slice*
Truncate( *#
_output_shapes
:?????????*

DstT0*

SrcT0	
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/UniqueUnique?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*
out_idx0*
T0	*2
_output_shapes 
:?????????:?????????
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/axisConst*
value	B : *n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/embedding_lookupGatherV2`dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/read?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/Unique?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/axis*
Taxis0*
Tindices0	*
Tparams0*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*'
_output_shapes
:?????????
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentity?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:?????????
?
zdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparseSparseSegmentMean?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/Unique:1dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:?????????
?
rdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape_1/shapeConst*
valueB"????   *
dtype0*
_output_shapes
:
?
ldnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape_1Reshape?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:2rdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:?????????
?
hdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/ShapeShapezdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
?
vdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
?
xdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
?
xdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/strided_sliceStridedSlicehdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Shapevdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/strided_slice/stackxdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/strided_slice/stack_1xdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
?
jdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
?
hdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/stackPackjdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/stack/0pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/strided_slice*
T0*

axis *
N*
_output_shapes
:
?
gdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/TileTileldnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape_1hdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/stack*

Tmultiples0*
T0
*0
_output_shapes
:??????????????????
?
mdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/zeros_like	ZerosLikezdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
?
bdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weightsSelectgdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Tilemdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/zeros_likezdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse*'
_output_shapes
:?????????*
T0
?
idnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Cast_1Cast^dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/dense_shape*
Truncate( *
_output_shapes
:*

DstT0*

SrcT0	
?
pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:
?
odnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
?
jdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_1Sliceidnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Cast_1pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_1/beginodnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_1/size*
Index0*
T0*
_output_shapes
:
?
jdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Shape_1Shapebdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights*
T0*
out_type0*
_output_shapes
:
?
pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:
?
odnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_2/sizeConst*
valueB:
?????????*
dtype0*
_output_shapes
:
?
jdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_2Slicejdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Shape_1pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_2/beginodnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_2/size*
_output_shapes
:*
Index0*
T0
?
ndnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
idnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/concatConcatV2jdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_1jdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_2ndnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
?
ldnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape_2Reshapebdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weightsidnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/concat*'
_output_shapes
:?????????*
T0*
Tshape0
?
Hdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/ShapeShapeldnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape_2*
T0*
out_type0*
_output_shapes
:
?
Vdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
?
Xdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
Xdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
Pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/strided_sliceStridedSliceHdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/ShapeVdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/strided_slice/stackXdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/strided_slice/stack_1Xdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
?
Rdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/Reshape/shape/1Const*
dtype0*
_output_shapes
: *
value	B :
?
Pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/Reshape/shapePackPdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/strided_sliceRdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/Reshape/shape/1*
N*
_output_shapes
:*
T0*

axis 
?
Jdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/ReshapeReshapeldnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape_2Pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/Reshape/shape*'
_output_shapes
:?????????*
T0*
Tshape0
?
Idnn/input_from_feature_columns/input_layer/gestation_weeks/ExpandDims/dimConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
?
Ednn/input_from_feature_columns/input_layer/gestation_weeks/ExpandDims
ExpandDimsIteratorGetNext:2Idnn/input_from_feature_columns/input_layer/gestation_weeks/ExpandDims/dim*

Tdim0*
T0*'
_output_shapes
:?????????
?
@dnn/input_from_feature_columns/input_layer/gestation_weeks/ShapeShapeEdnn/input_from_feature_columns/input_layer/gestation_weeks/ExpandDims*
T0*
out_type0*
_output_shapes
:
?
Ndnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
?
Pdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
Pdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
Hdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_sliceStridedSlice@dnn/input_from_feature_columns/input_layer/gestation_weeks/ShapeNdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stackPdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stack_1Pdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
?
Jdnn/input_from_feature_columns/input_layer/gestation_weeks/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
?
Hdnn/input_from_feature_columns/input_layer/gestation_weeks/Reshape/shapePackHdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_sliceJdnn/input_from_feature_columns/input_layer/gestation_weeks/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:
?
Bdnn/input_from_feature_columns/input_layer/gestation_weeks/ReshapeReshapeEdnn/input_from_feature_columns/input_layer/gestation_weeks/ExpandDimsHdnn/input_from_feature_columns/input_layer/gestation_weeks/Reshape/shape*'
_output_shapes
:?????????*
T0*
Tshape0
?
Kdnn/input_from_feature_columns/input_layer/is_male_embedding/ExpandDims/dimConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
?
Gdnn/input_from_feature_columns/input_layer/is_male_embedding/ExpandDims
ExpandDimsIteratorGetNext:3Kdnn/input_from_feature_columns/input_layer/is_male_embedding/ExpandDims/dim*'
_output_shapes
:?????????*

Tdim0*
T0
?
[dnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/ignore_value/xConst*
dtype0*
_output_shapes
: *
valueB B 
?
Udnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/NotEqualNotEqualGdnn/input_from_feature_columns/input_layer/is_male_embedding/ExpandDims[dnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/ignore_value/x*
T0*'
_output_shapes
:?????????
?
Tdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/indicesWhereUdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/NotEqual*'
_output_shapes
:?????????*
T0

?
Sdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/valuesGatherNdGdnn/input_from_feature_columns/input_layer/is_male_embedding/ExpandDimsTdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/indices*
Tparams0*#
_output_shapes
:?????????*
Tindices0	
?
Xdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/dense_shapeShapeGdnn/input_from_feature_columns/input_layer/is_male_embedding/ExpandDims*
T0*
out_type0	*
_output_shapes
:
?
Qdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/ConstConst* 
valueBBTrueBFalse*
dtype0*
_output_shapes
:
?
Pdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/SizeConst*
value	B :*
dtype0*
_output_shapes
: 
?
Wdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
?
Wdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
Qdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/rangeRangeWdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/range/startPdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/SizeWdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/range/delta*

Tidx0*
_output_shapes
:
?
Sdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/ToInt64CastQdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/range*

SrcT0*
Truncate( *
_output_shapes
:*

DstT0	
?
\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/hash_table/ConstConst*
valueB	 R
?????????*
dtype0	*
_output_shapes
: 
?
Vdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/hash_tableHashTableV2*
value_dtype0	*
_output_shapes
: *
shared_name *
use_node_name_sharing( *
	key_dtype0*
	container 
?
adnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/hash_table/table_initLookupTableImportV2Vdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/hash_tableQdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/ConstSdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/ToInt64*	
Tin0*

Tout0	
?
Ndnn/input_from_feature_columns/input_layer/is_male_embedding/hash_table_LookupLookupTableFindV2Vdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/hash_tableSdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/values\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/hash_table/Const*

Tout0	*#
_output_shapes
:?????????*	
Tin0
?
bdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice/beginConst*
dtype0*
_output_shapes
:*
valueB: 
?
adnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
?
\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SliceSliceXdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/dense_shapebdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice/beginadnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice/size*
Index0*
T0	*
_output_shapes
:
?
\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/ConstConst*
valueB: *
dtype0*
_output_shapes
:
?
[dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/ProdProd\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Const*
	keep_dims( *

Tidx0*
T0	*
_output_shapes
: 
?
gdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2/indicesConst*
value	B :*
dtype0*
_output_shapes
: 
?
ddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
?
_dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2GatherV2Xdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/dense_shapegdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2/indicesddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2/axis*
_output_shapes
: *
Taxis0*
Tindices0*
Tparams0	
?
]dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Cast/xPack[dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Prod_dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2*
T0	*

axis *
N*
_output_shapes
:
?
ddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseReshapeSparseReshapeTdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/indicesXdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/dense_shape]dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Cast/x*-
_output_shapes
:?????????:
?
mdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseReshape/IdentityIdentityNdnn/input_from_feature_columns/input_layer/is_male_embedding/hash_table_Lookup*#
_output_shapes
:?????????*
T0	
?
ednn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
?
cdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GreaterEqualGreaterEqualmdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseReshape/Identityednn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GreaterEqual/y*
T0	*#
_output_shapes
:?????????
?
\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/WhereWherecdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GreaterEqual*
T0
*'
_output_shapes
:?????????
?
ddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshape/shapeConst*
valueB:
?????????*
dtype0*
_output_shapes
:
?
^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/ReshapeReshape\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Whereddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:?????????
?
fdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 
?
adnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2_1GatherV2ddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseReshape^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshapefdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2_1/axis*
Tparams0	*'
_output_shapes
:?????????*
Taxis0*
Tindices0	
?
fdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
adnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2_2GatherV2mdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseReshape/Identity^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshapefdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2_2/axis*
Tparams0	*#
_output_shapes
:?????????*
Taxis0*
Tindices0	
?
_dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/IdentityIdentityfdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseReshape:1*
_output_shapes
:*
T0	
?
pdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 
?
~dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsadnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2_1adnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2_2_dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Identitypdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:?????????:?????????:?????????:?????????
?
?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
?
|dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlice~dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/strided_slice/stack?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*#
_output_shapes
:?????????*
Index0*
T0	
?
sdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/CastCast|dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *#
_output_shapes
:?????????*

DstT0
?
udnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/UniqueUnique?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*
out_idx0*
T0	*2
_output_shapes 
:?????????:?????????
?
?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/embedding_lookup/axisConst*
value	B : *h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/embedding_lookupGatherV2Zdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/readudnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/Unique?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/embedding_lookup/axis*
Tindices0	*
Tparams0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*'
_output_shapes
:?????????*
Taxis0
?
?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentitydnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/embedding_lookup*'
_output_shapes
:?????????*
T0
?
ndnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparseSparseSegmentMean?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identitywdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/Unique:1sdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/Cast*'
_output_shapes
:?????????*

Tidx0*
T0
?
fdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshape_1/shapeConst*
valueB"????   *
dtype0*
_output_shapes
:
?
`dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshape_1Reshape?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:2fdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:?????????
?
\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/ShapeShapendnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
?
jdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
?
ldnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
?
ldnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
ddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/strided_sliceStridedSlice\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Shapejdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/strided_slice/stackldnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/strided_slice/stack_1ldnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
?
^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
?
\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/stackPack^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/stack/0ddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/strided_slice*
N*
_output_shapes
:*
T0*

axis 
?
[dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/TileTile`dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshape_1\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/stack*

Tmultiples0*
T0
*0
_output_shapes
:??????????????????
?
adnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/zeros_like	ZerosLikendnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
?
Vdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weightsSelect[dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Tileadnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/zeros_likendnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
?
]dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Cast_1CastXdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/dense_shape*

SrcT0	*
Truncate( *
_output_shapes
:*

DstT0
?
ddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:
?
cdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
?
^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_1Slice]dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Cast_1ddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_1/begincdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_1/size*
_output_shapes
:*
Index0*
T0
?
^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Shape_1ShapeVdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights*
T0*
out_type0*
_output_shapes
:
?
ddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB:
?
cdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_2/sizeConst*
valueB:
?????????*
dtype0*
_output_shapes
:
?
^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_2Slice^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Shape_1ddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_2/begincdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_2/size*
Index0*
T0*
_output_shapes
:
?
bdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
]dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/concatConcatV2^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_1^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_2bdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
?
`dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshape_2ReshapeVdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights]dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/concat*'
_output_shapes
:?????????*
T0*
Tshape0
?
Bdnn/input_from_feature_columns/input_layer/is_male_embedding/ShapeShape`dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshape_2*
T0*
out_type0*
_output_shapes
:
?
Pdnn/input_from_feature_columns/input_layer/is_male_embedding/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
?
Rdnn/input_from_feature_columns/input_layer/is_male_embedding/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
Rdnn/input_from_feature_columns/input_layer/is_male_embedding/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
Jdnn/input_from_feature_columns/input_layer/is_male_embedding/strided_sliceStridedSliceBdnn/input_from_feature_columns/input_layer/is_male_embedding/ShapePdnn/input_from_feature_columns/input_layer/is_male_embedding/strided_slice/stackRdnn/input_from_feature_columns/input_layer/is_male_embedding/strided_slice/stack_1Rdnn/input_from_feature_columns/input_layer/is_male_embedding/strided_slice/stack_2*
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask 
?
Ldnn/input_from_feature_columns/input_layer/is_male_embedding/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
?
Jdnn/input_from_feature_columns/input_layer/is_male_embedding/Reshape/shapePackJdnn/input_from_feature_columns/input_layer/is_male_embedding/strided_sliceLdnn/input_from_feature_columns/input_layer/is_male_embedding/Reshape/shape/1*
N*
_output_shapes
:*
T0*

axis 
?
Ddnn/input_from_feature_columns/input_layer/is_male_embedding/ReshapeReshape`dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshape_2Jdnn/input_from_feature_columns/input_layer/is_male_embedding/Reshape/shape*'
_output_shapes
:?????????*
T0*
Tshape0
?
Ddnn/input_from_feature_columns/input_layer/mother_age/ExpandDims/dimConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
?
@dnn/input_from_feature_columns/input_layer/mother_age/ExpandDims
ExpandDimsIteratorGetNext:5Ddnn/input_from_feature_columns/input_layer/mother_age/ExpandDims/dim*'
_output_shapes
:?????????*

Tdim0*
T0
?
;dnn/input_from_feature_columns/input_layer/mother_age/ShapeShape@dnn/input_from_feature_columns/input_layer/mother_age/ExpandDims*
T0*
out_type0*
_output_shapes
:
?
Idnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
?
Kdnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
Kdnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
Cdnn/input_from_feature_columns/input_layer/mother_age/strided_sliceStridedSlice;dnn/input_from_feature_columns/input_layer/mother_age/ShapeIdnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stackKdnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stack_1Kdnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stack_2*
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask 
?
Ednn/input_from_feature_columns/input_layer/mother_age/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
?
Cdnn/input_from_feature_columns/input_layer/mother_age/Reshape/shapePackCdnn/input_from_feature_columns/input_layer/mother_age/strided_sliceEdnn/input_from_feature_columns/input_layer/mother_age/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:
?
=dnn/input_from_feature_columns/input_layer/mother_age/ReshapeReshape@dnn/input_from_feature_columns/input_layer/mother_age/ExpandDimsCdnn/input_from_feature_columns/input_layer/mother_age/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:?????????
?
Rdnn/input_from_feature_columns/input_layer/mother_married_embedding/ExpandDims/dimConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
?
Ndnn/input_from_feature_columns/input_layer/mother_married_embedding/ExpandDims
ExpandDimsIteratorGetNext:6Rdnn/input_from_feature_columns/input_layer/mother_married_embedding/ExpandDims/dim*'
_output_shapes
:?????????*

Tdim0*
T0
?
bdnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/ignore_value/xConst*
valueB B *
dtype0*
_output_shapes
: 
?
\dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/NotEqualNotEqualNdnn/input_from_feature_columns/input_layer/mother_married_embedding/ExpandDimsbdnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/ignore_value/x*
T0*'
_output_shapes
:?????????
?
[dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/indicesWhere\dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/NotEqual*
T0
*'
_output_shapes
:?????????
?
Zdnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/valuesGatherNdNdnn/input_from_feature_columns/input_layer/mother_married_embedding/ExpandDims[dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/indices*#
_output_shapes
:?????????*
Tindices0	*
Tparams0
?
_dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/dense_shapeShapeNdnn/input_from_feature_columns/input_layer/mother_married_embedding/ExpandDims*
T0*
out_type0	*
_output_shapes
:
?
_dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/ConstConst*
dtype0*
_output_shapes
:* 
valueBBTrueBFalse
?
^dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/SizeConst*
dtype0*
_output_shapes
: *
value	B :
?
ednn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
?
ednn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
?
_dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/rangeRangeednn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/range/start^dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/Sizeednn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/range/delta*

Tidx0*
_output_shapes
:
?
adnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/ToInt64Cast_dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/range*

SrcT0*
Truncate( *
_output_shapes
:*

DstT0	
?
jdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/hash_table/ConstConst*
valueB	 R
?????????*
dtype0	*
_output_shapes
: 
?
ddnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/hash_tableHashTableV2*
value_dtype0	*
_output_shapes
: *
shared_name *
use_node_name_sharing( *
	key_dtype0*
	container 
?
odnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/hash_table/table_initLookupTableImportV2ddnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/hash_table_dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/Constadnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/ToInt64*	
Tin0*

Tout0	
?
Udnn/input_from_feature_columns/input_layer/mother_married_embedding/hash_table_LookupLookupTableFindV2ddnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/hash_tableZdnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/valuesjdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/hash_table/Const*#
_output_shapes
:?????????*	
Tin0*

Tout0	
?
pdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:
?
odnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
?
jdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SliceSlice_dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/dense_shapepdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice/beginodnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice/size*
Index0*
T0	*
_output_shapes
:
?
jdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
?
idnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/ProdProdjdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slicejdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Const*
T0	*
_output_shapes
: *
	keep_dims( *

Tidx0
?
udnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2/indicesConst*
dtype0*
_output_shapes
: *
value	B :
?
rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
mdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2GatherV2_dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/dense_shapeudnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2/indicesrdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2/axis*
_output_shapes
: *
Taxis0*
Tindices0*
Tparams0	
?
kdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Cast/xPackidnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Prodmdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2*
T0	*

axis *
N*
_output_shapes
:
?
rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseReshapeSparseReshape[dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/indices_dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/dense_shapekdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Cast/x*-
_output_shapes
:?????????:
?
{dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseReshape/IdentityIdentityUdnn/input_from_feature_columns/input_layer/mother_married_embedding/hash_table_Lookup*
T0	*#
_output_shapes
:?????????
?
sdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
?
qdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GreaterEqualGreaterEqual{dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseReshape/Identitysdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GreaterEqual/y*
T0	*#
_output_shapes
:?????????
?
jdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/WhereWhereqdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GreaterEqual*
T0
*'
_output_shapes
:?????????
?
rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
?????????
?
ldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/ReshapeReshapejdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Whererdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:?????????
?
tdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
odnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2_1GatherV2rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseReshapeldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshapetdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2_1/axis*
Tparams0	*'
_output_shapes
:?????????*
Taxis0*
Tindices0	
?
tdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
odnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2_2GatherV2{dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseReshape/Identityldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshapetdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2_2/axis*
Tindices0	*
Tparams0	*#
_output_shapes
:?????????*
Taxis0
?
mdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/IdentityIdentitytdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseReshape:1*
_output_shapes
:*
T0	
?
~dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsodnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2_1odnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2_2mdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Identity~dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:?????????:?????????:?????????:?????????
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlice?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/strided_slice/stack?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
shrink_axis_mask*
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask*#
_output_shapes
:?????????*
Index0*
T0	
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/CastCast?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *#
_output_shapes
:?????????*

DstT0
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/UniqueUnique?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*
out_idx0*
T0	*2
_output_shapes 
:?????????:?????????
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/embedding_lookup/axisConst*
value	B : *o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/embedding_lookupGatherV2adnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/read?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/Unique?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/embedding_lookup/axis*
Tindices0	*
Tparams0*o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*'
_output_shapes
:?????????*
Taxis0
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentity?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:?????????
?
|dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparseSparseSegmentMean?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/Unique:1?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:?????????
?
tdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshape_1/shapeConst*
valueB"????   *
dtype0*
_output_shapes
:
?
ndnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshape_1Reshape?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:2tdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:?????????
?
jdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/ShapeShape|dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
?
xdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
?
zdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
?
zdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/strided_sliceStridedSlicejdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Shapexdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/strided_slice/stackzdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/strided_slice/stack_1zdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
?
ldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
?
jdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/stackPackldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/stack/0rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/strided_slice*
N*
_output_shapes
:*
T0*

axis 
?
idnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/TileTilendnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshape_1jdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/stack*0
_output_shapes
:??????????????????*

Tmultiples0*
T0

?
odnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/zeros_like	ZerosLike|dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
?
ddnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weightsSelectidnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Tileodnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/zeros_like|dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
?
kdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Cast_1Cast_dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/dense_shape*
Truncate( *
_output_shapes
:*

DstT0*

SrcT0	
?
rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_1/beginConst*
dtype0*
_output_shapes
:*
valueB: 
?
qdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
?
ldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_1Slicekdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Cast_1rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_1/beginqdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_1/size*
_output_shapes
:*
Index0*
T0
?
ldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Shape_1Shapeddnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights*
T0*
out_type0*
_output_shapes
:
?
rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB:
?
qdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_2/sizeConst*
dtype0*
_output_shapes
:*
valueB:
?????????
?
ldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_2Sliceldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Shape_1rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_2/beginqdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_2/size*
_output_shapes
:*
Index0*
T0
?
pdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
?
kdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/concatConcatV2ldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_1ldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_2pdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/concat/axis*

Tidx0*
T0*
N*
_output_shapes
:
?
ndnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshape_2Reshapeddnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weightskdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/concat*
T0*
Tshape0*'
_output_shapes
:?????????
?
Idnn/input_from_feature_columns/input_layer/mother_married_embedding/ShapeShapendnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshape_2*
T0*
out_type0*
_output_shapes
:
?
Wdnn/input_from_feature_columns/input_layer/mother_married_embedding/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
?
Ydnn/input_from_feature_columns/input_layer/mother_married_embedding/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
Ydnn/input_from_feature_columns/input_layer/mother_married_embedding/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
Qdnn/input_from_feature_columns/input_layer/mother_married_embedding/strided_sliceStridedSliceIdnn/input_from_feature_columns/input_layer/mother_married_embedding/ShapeWdnn/input_from_feature_columns/input_layer/mother_married_embedding/strided_slice/stackYdnn/input_from_feature_columns/input_layer/mother_married_embedding/strided_slice/stack_1Ydnn/input_from_feature_columns/input_layer/mother_married_embedding/strided_slice/stack_2*
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask 
?
Sdnn/input_from_feature_columns/input_layer/mother_married_embedding/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
?
Qdnn/input_from_feature_columns/input_layer/mother_married_embedding/Reshape/shapePackQdnn/input_from_feature_columns/input_layer/mother_married_embedding/strided_sliceSdnn/input_from_feature_columns/input_layer/mother_married_embedding/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:
?
Kdnn/input_from_feature_columns/input_layer/mother_married_embedding/ReshapeReshapendnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshape_2Qdnn/input_from_feature_columns/input_layer/mother_married_embedding/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:?????????
?
Odnn/input_from_feature_columns/input_layer/mother_race_embedding/ExpandDims/dimConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
?
Kdnn/input_from_feature_columns/input_layer/mother_race_embedding/ExpandDims
ExpandDimsIteratorGetNext:7Odnn/input_from_feature_columns/input_layer/mother_race_embedding/ExpandDims/dim*'
_output_shapes
:?????????*

Tdim0*
T0
?
_dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/ignore_value/xConst*
dtype0*
_output_shapes
: *
valueB B 
?
Ydnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/NotEqualNotEqualKdnn/input_from_feature_columns/input_layer/mother_race_embedding/ExpandDims_dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/ignore_value/x*
T0*'
_output_shapes
:?????????
?
Xdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/indicesWhereYdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/NotEqual*'
_output_shapes
:?????????*
T0

?
Wdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/valuesGatherNdKdnn/input_from_feature_columns/input_layer/mother_race_embedding/ExpandDimsXdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/indices*#
_output_shapes
:?????????*
Tindices0	*
Tparams0
?
\dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/dense_shapeShapeKdnn/input_from_feature_columns/input_layer/mother_race_embedding/ExpandDims*
T0*
out_type0	*
_output_shapes
:
?
Ydnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/ConstConst*?
value?B?BWhiteBBlackBAmerican IndianBChineseBJapaneseBHawaiianBFilipinoBUnknownBAsian IndianBKoreanBSamaonB
Vietnamese*
dtype0*
_output_shapes
:
?
Xdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/SizeConst*
value	B :*
dtype0*
_output_shapes
: 
?
_dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
?
_dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
?
Ydnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/rangeRange_dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range/startXdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/Size_dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range/delta*

Tidx0*
_output_shapes
:
?
[dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/ToInt64CastYdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range*
Truncate( *
_output_shapes
:*

DstT0	*

SrcT0
?
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_table/ConstConst*
valueB	 R
?????????*
dtype0	*
_output_shapes
: 
?
^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_tableHashTableV2*
value_dtype0	*
_output_shapes
: *
shared_name *
use_node_name_sharing( *
	key_dtype0*
	container 
?
idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_table/table_initLookupTableImportV2^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_tableYdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/Const[dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/ToInt64*

Tout0	*	
Tin0
?
Rdnn/input_from_feature_columns/input_layer/mother_race_embedding/hash_table_LookupLookupTableFindV2^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_tableWdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/valuesddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_table/Const*#
_output_shapes
:?????????*	
Tin0*

Tout0	
?
jdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:
?
idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
?
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SliceSlice\dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/dense_shapejdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice/beginidnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice/size*
Index0*
T0	*
_output_shapes
:
?
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/ConstConst*
valueB: *
dtype0*
_output_shapes
:
?
cdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/ProdProdddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Sliceddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Const*
T0	*
_output_shapes
: *
	keep_dims( *

Tidx0
?
odnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2/indicesConst*
value	B :*
dtype0*
_output_shapes
: 
?
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
gdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2GatherV2\dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/dense_shapeodnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2/indicesldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2/axis*
Tindices0*
Tparams0	*
_output_shapes
: *
Taxis0
?
ednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Cast/xPackcdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Prodgdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2*
T0	*

axis *
N*
_output_shapes
:
?
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshapeSparseReshapeXdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/indices\dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/dense_shapeednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Cast/x*-
_output_shapes
:?????????:
?
udnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshape/IdentityIdentityRdnn/input_from_feature_columns/input_layer/mother_race_embedding/hash_table_Lookup*#
_output_shapes
:?????????*
T0	
?
mdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
?
kdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GreaterEqualGreaterEqualudnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshape/Identitymdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GreaterEqual/y*
T0	*#
_output_shapes
:?????????
?
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/WhereWherekdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GreaterEqual*
T0
*'
_output_shapes
:?????????
?
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape/shapeConst*
valueB:
?????????*
dtype0*
_output_shapes
:
?
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/ReshapeReshapeddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Whereldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:?????????
?
ndnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 
?
idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2_1GatherV2ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshapefdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshapendnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2_1/axis*
Tparams0	*'
_output_shapes
:?????????*
Taxis0*
Tindices0	
?
ndnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2_2GatherV2udnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshape/Identityfdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshapendnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2_2/axis*
Tparams0	*#
_output_shapes
:?????????*
Taxis0*
Tindices0	
?
gdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/IdentityIdentityndnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshape:1*
T0	*
_output_shapes
:
?
xdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsidnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2_1idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2_2gdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Identityxdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:?????????:?????????:?????????:?????????
?
?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlice?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stack?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
shrink_axis_mask*
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask*#
_output_shapes
:?????????*
Index0*
T0	
?
{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/CastCast?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *#
_output_shapes
:?????????*

DstT0
?
}dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/UniqueUnique?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*
out_idx0*
T0	*2
_output_shapes 
:?????????:?????????
?
?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/embedding_lookup/axisConst*
value	B : *l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/embedding_lookupGatherV2^dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/read}dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/Unique?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/embedding_lookup/axis*
Tindices0	*
Tparams0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*'
_output_shapes
:?????????*
Taxis0
?
?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentity?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:?????????
?
vdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparseSparseSegmentMean?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identitydnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/Unique:1{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:?????????
?
ndnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_1/shapeConst*
valueB"????   *
dtype0*
_output_shapes
:
?
hdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_1Reshape?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:2ndnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:?????????
?
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/ShapeShapevdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse*
_output_shapes
:*
T0*
out_type0
?
rdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
?
tdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
tdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_sliceStridedSliceddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Shaperdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stacktdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stack_1tdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
?
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
?
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/stackPackfdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/stack/0ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice*
T0*

axis *
N*
_output_shapes
:
?
cdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/TileTilehdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_1ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/stack*
T0
*0
_output_shapes
:??????????????????*

Tmultiples0
?
idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/zeros_like	ZerosLikevdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
?
^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weightsSelectcdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Tileidnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/zeros_likevdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse*'
_output_shapes
:?????????*
T0
?
ednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Cast_1Cast\dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/dense_shape*

SrcT0	*
Truncate( *
_output_shapes
:*

DstT0
?
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:
?
kdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
?
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1Sliceednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Cast_1ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1/beginkdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1/size*
Index0*
T0*
_output_shapes
:
?
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Shape_1Shape^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights*
T0*
out_type0*
_output_shapes
:
?
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:
?
kdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2/sizeConst*
valueB:
?????????*
dtype0*
_output_shapes
:
?
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2Slicefdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Shape_1ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2/beginkdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2/size*
Index0*
T0*
_output_shapes
:
?
jdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
ednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/concatConcatV2fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2jdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/concat/axis*

Tidx0*
T0*
N*
_output_shapes
:
?
hdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_2Reshape^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weightsednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/concat*
T0*
Tshape0*'
_output_shapes
:?????????
?
Fdnn/input_from_feature_columns/input_layer/mother_race_embedding/ShapeShapehdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_2*
T0*
out_type0*
_output_shapes
:
?
Tdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
?
Vdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
Vdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
Ndnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_sliceStridedSliceFdnn/input_from_feature_columns/input_layer/mother_race_embedding/ShapeTdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stackVdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stack_1Vdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stack_2*
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask 
?
Pdnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape/shape/1Const*
dtype0*
_output_shapes
: *
value	B :
?
Ndnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape/shapePackNdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slicePdnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:
?
Hdnn/input_from_feature_columns/input_layer/mother_race_embedding/ReshapeReshapehdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_2Ndnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape/shape*'
_output_shapes
:?????????*
T0*
Tshape0
?
Cdnn/input_from_feature_columns/input_layer/plurality/ExpandDims/dimConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/plurality/ExpandDims
ExpandDimsIteratorGetNext:8Cdnn/input_from_feature_columns/input_layer/plurality/ExpandDims/dim*'
_output_shapes
:?????????*

Tdim0*
T0
?
:dnn/input_from_feature_columns/input_layer/plurality/ShapeShape?dnn/input_from_feature_columns/input_layer/plurality/ExpandDims*
T0*
out_type0*
_output_shapes
:
?
Hdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
?
Jdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
Jdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
Bdnn/input_from_feature_columns/input_layer/plurality/strided_sliceStridedSlice:dnn/input_from_feature_columns/input_layer/plurality/ShapeHdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stackJdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stack_1Jdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stack_2*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask
?
Ddnn/input_from_feature_columns/input_layer/plurality/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
?
Bdnn/input_from_feature_columns/input_layer/plurality/Reshape/shapePackBdnn/input_from_feature_columns/input_layer/plurality/strided_sliceDdnn/input_from_feature_columns/input_layer/plurality/Reshape/shape/1*
N*
_output_shapes
:*
T0*

axis 
?
<dnn/input_from_feature_columns/input_layer/plurality/ReshapeReshape?dnn/input_from_feature_columns/input_layer/plurality/ExpandDimsBdnn/input_from_feature_columns/input_layer/plurality/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:?????????
x
6dnn/input_from_feature_columns/input_layer/concat/axisConst*
dtype0*
_output_shapes
: *
value	B :
?
1dnn/input_from_feature_columns/input_layer/concatConcatV2Hdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/ReshapeJdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/ReshapeBdnn/input_from_feature_columns/input_layer/gestation_weeks/ReshapeDdnn/input_from_feature_columns/input_layer/is_male_embedding/Reshape=dnn/input_from_feature_columns/input_layer/mother_age/ReshapeKdnn/input_from_feature_columns/input_layer/mother_married_embedding/ReshapeHdnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape<dnn/input_from_feature_columns/input_layer/plurality/Reshape6dnn/input_from_feature_columns/input_layer/concat/axis*
T0*
N*'
_output_shapes
:?????????*

Tidx0
?
@dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/shapeConst*
valueB"       *2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes
:
?
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/minConst*
valueB
 *Xﶾ*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes
: 
?
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/maxConst*
valueB
 *X??>*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes
: 
?
Hdnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/shape*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
seed2?*
dtype0*
_output_shapes

: *
seedޱ?	
?
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
_output_shapes
: 
?
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/sub*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
_output_shapes

: 
?
:dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
_output_shapes

: 
?
dnn/hiddenlayer_0/kernel/part_0VarHandleOp*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
	container *
shape
: *
dtype0*
_output_shapes
: *0
shared_name!dnn/hiddenlayer_0/kernel/part_0
?
@dnn/hiddenlayer_0/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_0/kernel/part_0*
_output_shapes
: 
?
&dnn/hiddenlayer_0/kernel/part_0/AssignAssignVariableOpdnn/hiddenlayer_0/kernel/part_0:dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0
?
3dnn/hiddenlayer_0/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes

: 
?
/dnn/hiddenlayer_0/bias/part_0/Initializer/zerosConst*
valueB *    *0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes
: 
?
dnn/hiddenlayer_0/bias/part_0VarHandleOp*
dtype0*
_output_shapes
: *.
shared_namednn/hiddenlayer_0/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
	container *
shape: 
?
>dnn/hiddenlayer_0/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_0/bias/part_0*
_output_shapes
: 
?
$dnn/hiddenlayer_0/bias/part_0/AssignAssignVariableOpdnn/hiddenlayer_0/bias/part_0/dnn/hiddenlayer_0/bias/part_0/Initializer/zeros*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
dtype0
?
1dnn/hiddenlayer_0/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes
: 
?
'dnn/hiddenlayer_0/kernel/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes

: 
v
dnn/hiddenlayer_0/kernelIdentity'dnn/hiddenlayer_0/kernel/ReadVariableOp*
T0*
_output_shapes

: 
?
dnn/hiddenlayer_0/MatMulMatMul1dnn/input_from_feature_columns/input_layer/concatdnn/hiddenlayer_0/kernel*
transpose_b( *
T0*'
_output_shapes
:????????? *
transpose_a( 

%dnn/hiddenlayer_0/bias/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes
: 
n
dnn/hiddenlayer_0/biasIdentity%dnn/hiddenlayer_0/bias/ReadVariableOp*
T0*
_output_shapes
: 
?
dnn/hiddenlayer_0/BiasAddBiasAdddnn/hiddenlayer_0/MatMuldnn/hiddenlayer_0/bias*
T0*
data_formatNHWC*'
_output_shapes
:????????? 
k
dnn/hiddenlayer_0/ReluReludnn/hiddenlayer_0/BiasAdd*'
_output_shapes
:????????? *
T0
?
;dnn/hiddenlayer_0/batchnorm_0/gamma/part_0/Initializer/onesConst*
valueB *  ??*=
_class3
1/loc:@dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*
dtype0*
_output_shapes
: 
?
*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0VarHandleOp*
dtype0*
_output_shapes
: *;
shared_name,*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*=
_class3
1/loc:@dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*
	container *
shape: 
?
Kdnn/hiddenlayer_0/batchnorm_0/gamma/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*
_output_shapes
: 
?
1dnn/hiddenlayer_0/batchnorm_0/gamma/part_0/AssignAssignVariableOp*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0;dnn/hiddenlayer_0/batchnorm_0/gamma/part_0/Initializer/ones*
dtype0*=
_class3
1/loc:@dnn/hiddenlayer_0/batchnorm_0/gamma/part_0
?
>dnn/hiddenlayer_0/batchnorm_0/gamma/part_0/Read/ReadVariableOpReadVariableOp*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*=
_class3
1/loc:@dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*
dtype0*
_output_shapes
: 
?
;dnn/hiddenlayer_0/batchnorm_0/beta/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
: *
valueB *    *<
_class2
0.loc:@dnn/hiddenlayer_0/batchnorm_0/beta/part_0
?
)dnn/hiddenlayer_0/batchnorm_0/beta/part_0VarHandleOp*
shape: *
dtype0*
_output_shapes
: *:
shared_name+)dnn/hiddenlayer_0/batchnorm_0/beta/part_0*<
_class2
0.loc:@dnn/hiddenlayer_0/batchnorm_0/beta/part_0*
	container 
?
Jdnn/hiddenlayer_0/batchnorm_0/beta/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp)dnn/hiddenlayer_0/batchnorm_0/beta/part_0*
_output_shapes
: 
?
0dnn/hiddenlayer_0/batchnorm_0/beta/part_0/AssignAssignVariableOp)dnn/hiddenlayer_0/batchnorm_0/beta/part_0;dnn/hiddenlayer_0/batchnorm_0/beta/part_0/Initializer/zeros*<
_class2
0.loc:@dnn/hiddenlayer_0/batchnorm_0/beta/part_0*
dtype0
?
=dnn/hiddenlayer_0/batchnorm_0/beta/part_0/Read/ReadVariableOpReadVariableOp)dnn/hiddenlayer_0/batchnorm_0/beta/part_0*<
_class2
0.loc:@dnn/hiddenlayer_0/batchnorm_0/beta/part_0*
dtype0*
_output_shapes
: 
?
;dnn/hiddenlayer_0/batchnorm_0/moving_mean/Initializer/zerosConst*
valueB *    *<
_class2
0.loc:@dnn/hiddenlayer_0/batchnorm_0/moving_mean*
dtype0*
_output_shapes
: 
?
)dnn/hiddenlayer_0/batchnorm_0/moving_meanVarHandleOp*
dtype0*
_output_shapes
: *:
shared_name+)dnn/hiddenlayer_0/batchnorm_0/moving_mean*<
_class2
0.loc:@dnn/hiddenlayer_0/batchnorm_0/moving_mean*
	container *
shape: 
?
Jdnn/hiddenlayer_0/batchnorm_0/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp)dnn/hiddenlayer_0/batchnorm_0/moving_mean*
_output_shapes
: 
?
0dnn/hiddenlayer_0/batchnorm_0/moving_mean/AssignAssignVariableOp)dnn/hiddenlayer_0/batchnorm_0/moving_mean;dnn/hiddenlayer_0/batchnorm_0/moving_mean/Initializer/zeros*
dtype0*<
_class2
0.loc:@dnn/hiddenlayer_0/batchnorm_0/moving_mean
?
=dnn/hiddenlayer_0/batchnorm_0/moving_mean/Read/ReadVariableOpReadVariableOp)dnn/hiddenlayer_0/batchnorm_0/moving_mean*<
_class2
0.loc:@dnn/hiddenlayer_0/batchnorm_0/moving_mean*
dtype0*
_output_shapes
: 
?
>dnn/hiddenlayer_0/batchnorm_0/moving_variance/Initializer/onesConst*
valueB *  ??*@
_class6
42loc:@dnn/hiddenlayer_0/batchnorm_0/moving_variance*
dtype0*
_output_shapes
: 
?
-dnn/hiddenlayer_0/batchnorm_0/moving_varianceVarHandleOp*@
_class6
42loc:@dnn/hiddenlayer_0/batchnorm_0/moving_variance*
	container *
shape: *
dtype0*
_output_shapes
: *>
shared_name/-dnn/hiddenlayer_0/batchnorm_0/moving_variance
?
Ndnn/hiddenlayer_0/batchnorm_0/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp-dnn/hiddenlayer_0/batchnorm_0/moving_variance*
_output_shapes
: 
?
4dnn/hiddenlayer_0/batchnorm_0/moving_variance/AssignAssignVariableOp-dnn/hiddenlayer_0/batchnorm_0/moving_variance>dnn/hiddenlayer_0/batchnorm_0/moving_variance/Initializer/ones*@
_class6
42loc:@dnn/hiddenlayer_0/batchnorm_0/moving_variance*
dtype0
?
Adnn/hiddenlayer_0/batchnorm_0/moving_variance/Read/ReadVariableOpReadVariableOp-dnn/hiddenlayer_0/batchnorm_0/moving_variance*@
_class6
42loc:@dnn/hiddenlayer_0/batchnorm_0/moving_variance*
dtype0*
_output_shapes
: 
?
1dnn/hiddenlayer_0/batchnorm_0/beta/ReadVariableOpReadVariableOp)dnn/hiddenlayer_0/batchnorm_0/beta/part_0*
dtype0*
_output_shapes
: 
?
"dnn/hiddenlayer_0/batchnorm_0/betaIdentity1dnn/hiddenlayer_0/batchnorm_0/beta/ReadVariableOp*
_output_shapes
: *
T0
?
6dnn/hiddenlayer_0/batchnorm_0/batchnorm/ReadVariableOpReadVariableOp-dnn/hiddenlayer_0/batchnorm_0/moving_variance*
dtype0*
_output_shapes
: 
r
-dnn/hiddenlayer_0/batchnorm_0/batchnorm/add/yConst*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
+dnn/hiddenlayer_0/batchnorm_0/batchnorm/addAdd6dnn/hiddenlayer_0/batchnorm_0/batchnorm/ReadVariableOp-dnn/hiddenlayer_0/batchnorm_0/batchnorm/add/y*
_output_shapes
: *
T0
?
-dnn/hiddenlayer_0/batchnorm_0/batchnorm/RsqrtRsqrt+dnn/hiddenlayer_0/batchnorm_0/batchnorm/add*
_output_shapes
: *
T0
?
2dnn/hiddenlayer_0/batchnorm_0/gamma/ReadVariableOpReadVariableOp*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*
dtype0*
_output_shapes
: 
?
#dnn/hiddenlayer_0/batchnorm_0/gammaIdentity2dnn/hiddenlayer_0/batchnorm_0/gamma/ReadVariableOp*
_output_shapes
: *
T0
?
+dnn/hiddenlayer_0/batchnorm_0/batchnorm/mulMul-dnn/hiddenlayer_0/batchnorm_0/batchnorm/Rsqrt#dnn/hiddenlayer_0/batchnorm_0/gamma*
T0*
_output_shapes
: 
?
-dnn/hiddenlayer_0/batchnorm_0/batchnorm/mul_1Muldnn/hiddenlayer_0/Relu+dnn/hiddenlayer_0/batchnorm_0/batchnorm/mul*
T0*'
_output_shapes
:????????? 
?
8dnn/hiddenlayer_0/batchnorm_0/batchnorm/ReadVariableOp_1ReadVariableOp)dnn/hiddenlayer_0/batchnorm_0/moving_mean*
dtype0*
_output_shapes
: 
?
-dnn/hiddenlayer_0/batchnorm_0/batchnorm/mul_2Mul8dnn/hiddenlayer_0/batchnorm_0/batchnorm/ReadVariableOp_1+dnn/hiddenlayer_0/batchnorm_0/batchnorm/mul*
T0*
_output_shapes
: 
?
+dnn/hiddenlayer_0/batchnorm_0/batchnorm/subSub"dnn/hiddenlayer_0/batchnorm_0/beta-dnn/hiddenlayer_0/batchnorm_0/batchnorm/mul_2*
_output_shapes
: *
T0
?
-dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1Add-dnn/hiddenlayer_0/batchnorm_0/batchnorm/mul_1+dnn/hiddenlayer_0/batchnorm_0/batchnorm/sub*
T0*'
_output_shapes
:????????? 
~
dnn/zero_fraction/SizeSize-dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1*
T0*
out_type0	*
_output_shapes
: 
c
dnn/zero_fraction/LessEqual/yConst*
dtype0	*
_output_shapes
: *
valueB	 R????
?
dnn/zero_fraction/LessEqual	LessEqualdnn/zero_fraction/Sizednn/zero_fraction/LessEqual/y*
_output_shapes
: *
T0	
?
dnn/zero_fraction/cond/SwitchSwitchdnn/zero_fraction/LessEqualdnn/zero_fraction/LessEqual*
T0
*
_output_shapes
: : 
m
dnn/zero_fraction/cond/switch_tIdentitydnn/zero_fraction/cond/Switch:1*
T0
*
_output_shapes
: 
k
dnn/zero_fraction/cond/switch_fIdentitydnn/zero_fraction/cond/Switch*
_output_shapes
: *
T0

h
dnn/zero_fraction/cond/pred_idIdentitydnn/zero_fraction/LessEqual*
T0
*
_output_shapes
: 
?
*dnn/zero_fraction/cond/count_nonzero/zerosConst ^dnn/zero_fraction/cond/switch_t*
valueB
 *    *
dtype0*
_output_shapes
: 
?
-dnn/zero_fraction/cond/count_nonzero/NotEqualNotEqual6dnn/zero_fraction/cond/count_nonzero/NotEqual/Switch:1*dnn/zero_fraction/cond/count_nonzero/zeros*
T0*'
_output_shapes
:????????? 
?
4dnn/zero_fraction/cond/count_nonzero/NotEqual/SwitchSwitch-dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1dnn/zero_fraction/cond/pred_id*
T0*@
_class6
42loc:@dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1*:
_output_shapes(
&:????????? :????????? 
?
)dnn/zero_fraction/cond/count_nonzero/CastCast-dnn/zero_fraction/cond/count_nonzero/NotEqual*

SrcT0
*
Truncate( *'
_output_shapes
:????????? *

DstT0
?
*dnn/zero_fraction/cond/count_nonzero/ConstConst ^dnn/zero_fraction/cond/switch_t*
valueB"       *
dtype0*
_output_shapes
:
?
2dnn/zero_fraction/cond/count_nonzero/nonzero_countSum)dnn/zero_fraction/cond/count_nonzero/Cast*dnn/zero_fraction/cond/count_nonzero/Const*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
?
dnn/zero_fraction/cond/CastCast2dnn/zero_fraction/cond/count_nonzero/nonzero_count*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	
?
,dnn/zero_fraction/cond/count_nonzero_1/zerosConst ^dnn/zero_fraction/cond/switch_f*
dtype0*
_output_shapes
: *
valueB
 *    
?
/dnn/zero_fraction/cond/count_nonzero_1/NotEqualNotEqual6dnn/zero_fraction/cond/count_nonzero_1/NotEqual/Switch,dnn/zero_fraction/cond/count_nonzero_1/zeros*
T0*'
_output_shapes
:????????? 
?
6dnn/zero_fraction/cond/count_nonzero_1/NotEqual/SwitchSwitch-dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1dnn/zero_fraction/cond/pred_id*
T0*@
_class6
42loc:@dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1*:
_output_shapes(
&:????????? :????????? 
?
+dnn/zero_fraction/cond/count_nonzero_1/CastCast/dnn/zero_fraction/cond/count_nonzero_1/NotEqual*

SrcT0
*
Truncate( *'
_output_shapes
:????????? *

DstT0	
?
,dnn/zero_fraction/cond/count_nonzero_1/ConstConst ^dnn/zero_fraction/cond/switch_f*
dtype0*
_output_shapes
:*
valueB"       
?
4dnn/zero_fraction/cond/count_nonzero_1/nonzero_countSum+dnn/zero_fraction/cond/count_nonzero_1/Cast,dnn/zero_fraction/cond/count_nonzero_1/Const*
T0	*
_output_shapes
: *
	keep_dims( *

Tidx0
?
dnn/zero_fraction/cond/MergeMerge4dnn/zero_fraction/cond/count_nonzero_1/nonzero_countdnn/zero_fraction/cond/Cast*
T0	*
N*
_output_shapes
: : 
?
(dnn/zero_fraction/counts_to_fraction/subSubdnn/zero_fraction/Sizednn/zero_fraction/cond/Merge*
T0	*
_output_shapes
: 
?
)dnn/zero_fraction/counts_to_fraction/CastCast(dnn/zero_fraction/counts_to_fraction/sub*
Truncate( *
_output_shapes
: *

DstT0*

SrcT0	
?
+dnn/zero_fraction/counts_to_fraction/Cast_1Castdnn/zero_fraction/Size*
Truncate( *
_output_shapes
: *

DstT0*

SrcT0	
?
,dnn/zero_fraction/counts_to_fraction/truedivRealDiv)dnn/zero_fraction/counts_to_fraction/Cast+dnn/zero_fraction/counts_to_fraction/Cast_1*
T0*
_output_shapes
: 
u
dnn/zero_fraction/fractionIdentity,dnn/zero_fraction/counts_to_fraction/truediv*
T0*
_output_shapes
: 
?
2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsConst*>
value5B3 B-dnn/dnn/hiddenlayer_0/fraction_of_zero_values*
dtype0*
_output_shapes
: 
?
-dnn/dnn/hiddenlayer_0/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsdnn/zero_fraction/fraction*
T0*
_output_shapes
: 
?
$dnn/dnn/hiddenlayer_0/activation/tagConst*
dtype0*
_output_shapes
: *1
value(B& B dnn/dnn/hiddenlayer_0/activation
?
 dnn/dnn/hiddenlayer_0/activationHistogramSummary$dnn/dnn/hiddenlayer_0/activation/tag-dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1*
T0*
_output_shapes
: 
?
@dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/shapeConst*
valueB"       *2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes
:
?
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/minConst*
valueB
 *????*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes
: 
?
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/maxConst*
valueB
 *???>*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes
: 
?
Hdnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/shape*
dtype0*
_output_shapes

: *
seedޱ?	*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
seed2?
?
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
_output_shapes
: 
?
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/sub*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
_output_shapes

: 
?
:dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
_output_shapes

: 
?
dnn/hiddenlayer_1/kernel/part_0VarHandleOp*0
shared_name!dnn/hiddenlayer_1/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
	container *
shape
: *
dtype0*
_output_shapes
: 
?
@dnn/hiddenlayer_1/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_1/kernel/part_0*
_output_shapes
: 
?
&dnn/hiddenlayer_1/kernel/part_0/AssignAssignVariableOpdnn/hiddenlayer_1/kernel/part_0:dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
dtype0
?
3dnn/hiddenlayer_1/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes

: 
?
/dnn/hiddenlayer_1/bias/part_0/Initializer/zerosConst*
valueB*    *0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
dtype0*
_output_shapes
:
?
dnn/hiddenlayer_1/bias/part_0VarHandleOp*
dtype0*
_output_shapes
: *.
shared_namednn/hiddenlayer_1/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
	container *
shape:
?
>dnn/hiddenlayer_1/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_1/bias/part_0*
_output_shapes
: 
?
$dnn/hiddenlayer_1/bias/part_0/AssignAssignVariableOpdnn/hiddenlayer_1/bias/part_0/dnn/hiddenlayer_1/bias/part_0/Initializer/zeros*
dtype0*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0
?
1dnn/hiddenlayer_1/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
dtype0*
_output_shapes
:
?
'dnn/hiddenlayer_1/kernel/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes

: 
v
dnn/hiddenlayer_1/kernelIdentity'dnn/hiddenlayer_1/kernel/ReadVariableOp*
T0*
_output_shapes

: 
?
dnn/hiddenlayer_1/MatMulMatMul-dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1dnn/hiddenlayer_1/kernel*'
_output_shapes
:?????????*
transpose_a( *
transpose_b( *
T0

%dnn/hiddenlayer_1/bias/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0*
dtype0*
_output_shapes
:
n
dnn/hiddenlayer_1/biasIdentity%dnn/hiddenlayer_1/bias/ReadVariableOp*
T0*
_output_shapes
:
?
dnn/hiddenlayer_1/BiasAddBiasAdddnn/hiddenlayer_1/MatMuldnn/hiddenlayer_1/bias*
T0*
data_formatNHWC*'
_output_shapes
:?????????
k
dnn/hiddenlayer_1/ReluReludnn/hiddenlayer_1/BiasAdd*
T0*'
_output_shapes
:?????????
?
;dnn/hiddenlayer_1/batchnorm_1/gamma/part_0/Initializer/onesConst*
valueB*  ??*=
_class3
1/loc:@dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*
dtype0*
_output_shapes
:
?
*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0VarHandleOp*
dtype0*
_output_shapes
: *;
shared_name,*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*=
_class3
1/loc:@dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*
	container *
shape:
?
Kdnn/hiddenlayer_1/batchnorm_1/gamma/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*
_output_shapes
: 
?
1dnn/hiddenlayer_1/batchnorm_1/gamma/part_0/AssignAssignVariableOp*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0;dnn/hiddenlayer_1/batchnorm_1/gamma/part_0/Initializer/ones*=
_class3
1/loc:@dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*
dtype0
?
>dnn/hiddenlayer_1/batchnorm_1/gamma/part_0/Read/ReadVariableOpReadVariableOp*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*
dtype0*
_output_shapes
:*=
_class3
1/loc:@dnn/hiddenlayer_1/batchnorm_1/gamma/part_0
?
;dnn/hiddenlayer_1/batchnorm_1/beta/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *<
_class2
0.loc:@dnn/hiddenlayer_1/batchnorm_1/beta/part_0
?
)dnn/hiddenlayer_1/batchnorm_1/beta/part_0VarHandleOp*
shape:*
dtype0*
_output_shapes
: *:
shared_name+)dnn/hiddenlayer_1/batchnorm_1/beta/part_0*<
_class2
0.loc:@dnn/hiddenlayer_1/batchnorm_1/beta/part_0*
	container 
?
Jdnn/hiddenlayer_1/batchnorm_1/beta/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp)dnn/hiddenlayer_1/batchnorm_1/beta/part_0*
_output_shapes
: 
?
0dnn/hiddenlayer_1/batchnorm_1/beta/part_0/AssignAssignVariableOp)dnn/hiddenlayer_1/batchnorm_1/beta/part_0;dnn/hiddenlayer_1/batchnorm_1/beta/part_0/Initializer/zeros*
dtype0*<
_class2
0.loc:@dnn/hiddenlayer_1/batchnorm_1/beta/part_0
?
=dnn/hiddenlayer_1/batchnorm_1/beta/part_0/Read/ReadVariableOpReadVariableOp)dnn/hiddenlayer_1/batchnorm_1/beta/part_0*<
_class2
0.loc:@dnn/hiddenlayer_1/batchnorm_1/beta/part_0*
dtype0*
_output_shapes
:
?
;dnn/hiddenlayer_1/batchnorm_1/moving_mean/Initializer/zerosConst*
valueB*    *<
_class2
0.loc:@dnn/hiddenlayer_1/batchnorm_1/moving_mean*
dtype0*
_output_shapes
:
?
)dnn/hiddenlayer_1/batchnorm_1/moving_meanVarHandleOp*
dtype0*
_output_shapes
: *:
shared_name+)dnn/hiddenlayer_1/batchnorm_1/moving_mean*<
_class2
0.loc:@dnn/hiddenlayer_1/batchnorm_1/moving_mean*
	container *
shape:
?
Jdnn/hiddenlayer_1/batchnorm_1/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp)dnn/hiddenlayer_1/batchnorm_1/moving_mean*
_output_shapes
: 
?
0dnn/hiddenlayer_1/batchnorm_1/moving_mean/AssignAssignVariableOp)dnn/hiddenlayer_1/batchnorm_1/moving_mean;dnn/hiddenlayer_1/batchnorm_1/moving_mean/Initializer/zeros*<
_class2
0.loc:@dnn/hiddenlayer_1/batchnorm_1/moving_mean*
dtype0
?
=dnn/hiddenlayer_1/batchnorm_1/moving_mean/Read/ReadVariableOpReadVariableOp)dnn/hiddenlayer_1/batchnorm_1/moving_mean*<
_class2
0.loc:@dnn/hiddenlayer_1/batchnorm_1/moving_mean*
dtype0*
_output_shapes
:
?
>dnn/hiddenlayer_1/batchnorm_1/moving_variance/Initializer/onesConst*
dtype0*
_output_shapes
:*
valueB*  ??*@
_class6
42loc:@dnn/hiddenlayer_1/batchnorm_1/moving_variance
?
-dnn/hiddenlayer_1/batchnorm_1/moving_varianceVarHandleOp*
dtype0*
_output_shapes
: *>
shared_name/-dnn/hiddenlayer_1/batchnorm_1/moving_variance*@
_class6
42loc:@dnn/hiddenlayer_1/batchnorm_1/moving_variance*
	container *
shape:
?
Ndnn/hiddenlayer_1/batchnorm_1/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp-dnn/hiddenlayer_1/batchnorm_1/moving_variance*
_output_shapes
: 
?
4dnn/hiddenlayer_1/batchnorm_1/moving_variance/AssignAssignVariableOp-dnn/hiddenlayer_1/batchnorm_1/moving_variance>dnn/hiddenlayer_1/batchnorm_1/moving_variance/Initializer/ones*@
_class6
42loc:@dnn/hiddenlayer_1/batchnorm_1/moving_variance*
dtype0
?
Adnn/hiddenlayer_1/batchnorm_1/moving_variance/Read/ReadVariableOpReadVariableOp-dnn/hiddenlayer_1/batchnorm_1/moving_variance*@
_class6
42loc:@dnn/hiddenlayer_1/batchnorm_1/moving_variance*
dtype0*
_output_shapes
:
?
1dnn/hiddenlayer_1/batchnorm_1/beta/ReadVariableOpReadVariableOp)dnn/hiddenlayer_1/batchnorm_1/beta/part_0*
dtype0*
_output_shapes
:
?
"dnn/hiddenlayer_1/batchnorm_1/betaIdentity1dnn/hiddenlayer_1/batchnorm_1/beta/ReadVariableOp*
T0*
_output_shapes
:
?
6dnn/hiddenlayer_1/batchnorm_1/batchnorm/ReadVariableOpReadVariableOp-dnn/hiddenlayer_1/batchnorm_1/moving_variance*
dtype0*
_output_shapes
:
r
-dnn/hiddenlayer_1/batchnorm_1/batchnorm/add/yConst*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
+dnn/hiddenlayer_1/batchnorm_1/batchnorm/addAdd6dnn/hiddenlayer_1/batchnorm_1/batchnorm/ReadVariableOp-dnn/hiddenlayer_1/batchnorm_1/batchnorm/add/y*
_output_shapes
:*
T0
?
-dnn/hiddenlayer_1/batchnorm_1/batchnorm/RsqrtRsqrt+dnn/hiddenlayer_1/batchnorm_1/batchnorm/add*
T0*
_output_shapes
:
?
2dnn/hiddenlayer_1/batchnorm_1/gamma/ReadVariableOpReadVariableOp*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*
dtype0*
_output_shapes
:
?
#dnn/hiddenlayer_1/batchnorm_1/gammaIdentity2dnn/hiddenlayer_1/batchnorm_1/gamma/ReadVariableOp*
_output_shapes
:*
T0
?
+dnn/hiddenlayer_1/batchnorm_1/batchnorm/mulMul-dnn/hiddenlayer_1/batchnorm_1/batchnorm/Rsqrt#dnn/hiddenlayer_1/batchnorm_1/gamma*
T0*
_output_shapes
:
?
-dnn/hiddenlayer_1/batchnorm_1/batchnorm/mul_1Muldnn/hiddenlayer_1/Relu+dnn/hiddenlayer_1/batchnorm_1/batchnorm/mul*
T0*'
_output_shapes
:?????????
?
8dnn/hiddenlayer_1/batchnorm_1/batchnorm/ReadVariableOp_1ReadVariableOp)dnn/hiddenlayer_1/batchnorm_1/moving_mean*
dtype0*
_output_shapes
:
?
-dnn/hiddenlayer_1/batchnorm_1/batchnorm/mul_2Mul8dnn/hiddenlayer_1/batchnorm_1/batchnorm/ReadVariableOp_1+dnn/hiddenlayer_1/batchnorm_1/batchnorm/mul*
_output_shapes
:*
T0
?
+dnn/hiddenlayer_1/batchnorm_1/batchnorm/subSub"dnn/hiddenlayer_1/batchnorm_1/beta-dnn/hiddenlayer_1/batchnorm_1/batchnorm/mul_2*
T0*
_output_shapes
:
?
-dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1Add-dnn/hiddenlayer_1/batchnorm_1/batchnorm/mul_1+dnn/hiddenlayer_1/batchnorm_1/batchnorm/sub*'
_output_shapes
:?????????*
T0
?
dnn/zero_fraction_1/SizeSize-dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1*
T0*
out_type0	*
_output_shapes
: 
e
dnn/zero_fraction_1/LessEqual/yConst*
valueB	 R????*
dtype0	*
_output_shapes
: 
?
dnn/zero_fraction_1/LessEqual	LessEqualdnn/zero_fraction_1/Sizednn/zero_fraction_1/LessEqual/y*
T0	*
_output_shapes
: 
?
dnn/zero_fraction_1/cond/SwitchSwitchdnn/zero_fraction_1/LessEqualdnn/zero_fraction_1/LessEqual*
_output_shapes
: : *
T0

q
!dnn/zero_fraction_1/cond/switch_tIdentity!dnn/zero_fraction_1/cond/Switch:1*
T0
*
_output_shapes
: 
o
!dnn/zero_fraction_1/cond/switch_fIdentitydnn/zero_fraction_1/cond/Switch*
T0
*
_output_shapes
: 
l
 dnn/zero_fraction_1/cond/pred_idIdentitydnn/zero_fraction_1/LessEqual*
T0
*
_output_shapes
: 
?
,dnn/zero_fraction_1/cond/count_nonzero/zerosConst"^dnn/zero_fraction_1/cond/switch_t*
valueB
 *    *
dtype0*
_output_shapes
: 
?
/dnn/zero_fraction_1/cond/count_nonzero/NotEqualNotEqual8dnn/zero_fraction_1/cond/count_nonzero/NotEqual/Switch:1,dnn/zero_fraction_1/cond/count_nonzero/zeros*
T0*'
_output_shapes
:?????????
?
6dnn/zero_fraction_1/cond/count_nonzero/NotEqual/SwitchSwitch-dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1 dnn/zero_fraction_1/cond/pred_id*:
_output_shapes(
&:?????????:?????????*
T0*@
_class6
42loc:@dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1
?
+dnn/zero_fraction_1/cond/count_nonzero/CastCast/dnn/zero_fraction_1/cond/count_nonzero/NotEqual*

SrcT0
*
Truncate( *'
_output_shapes
:?????????*

DstT0
?
,dnn/zero_fraction_1/cond/count_nonzero/ConstConst"^dnn/zero_fraction_1/cond/switch_t*
valueB"       *
dtype0*
_output_shapes
:
?
4dnn/zero_fraction_1/cond/count_nonzero/nonzero_countSum+dnn/zero_fraction_1/cond/count_nonzero/Cast,dnn/zero_fraction_1/cond/count_nonzero/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
?
dnn/zero_fraction_1/cond/CastCast4dnn/zero_fraction_1/cond/count_nonzero/nonzero_count*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	
?
.dnn/zero_fraction_1/cond/count_nonzero_1/zerosConst"^dnn/zero_fraction_1/cond/switch_f*
valueB
 *    *
dtype0*
_output_shapes
: 
?
1dnn/zero_fraction_1/cond/count_nonzero_1/NotEqualNotEqual8dnn/zero_fraction_1/cond/count_nonzero_1/NotEqual/Switch.dnn/zero_fraction_1/cond/count_nonzero_1/zeros*
T0*'
_output_shapes
:?????????
?
8dnn/zero_fraction_1/cond/count_nonzero_1/NotEqual/SwitchSwitch-dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1 dnn/zero_fraction_1/cond/pred_id*
T0*@
_class6
42loc:@dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1*:
_output_shapes(
&:?????????:?????????
?
-dnn/zero_fraction_1/cond/count_nonzero_1/CastCast1dnn/zero_fraction_1/cond/count_nonzero_1/NotEqual*
Truncate( *'
_output_shapes
:?????????*

DstT0	*

SrcT0

?
.dnn/zero_fraction_1/cond/count_nonzero_1/ConstConst"^dnn/zero_fraction_1/cond/switch_f*
dtype0*
_output_shapes
:*
valueB"       
?
6dnn/zero_fraction_1/cond/count_nonzero_1/nonzero_countSum-dnn/zero_fraction_1/cond/count_nonzero_1/Cast.dnn/zero_fraction_1/cond/count_nonzero_1/Const*
T0	*
_output_shapes
: *
	keep_dims( *

Tidx0
?
dnn/zero_fraction_1/cond/MergeMerge6dnn/zero_fraction_1/cond/count_nonzero_1/nonzero_countdnn/zero_fraction_1/cond/Cast*
T0	*
N*
_output_shapes
: : 
?
*dnn/zero_fraction_1/counts_to_fraction/subSubdnn/zero_fraction_1/Sizednn/zero_fraction_1/cond/Merge*
T0	*
_output_shapes
: 
?
+dnn/zero_fraction_1/counts_to_fraction/CastCast*dnn/zero_fraction_1/counts_to_fraction/sub*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0
?
-dnn/zero_fraction_1/counts_to_fraction/Cast_1Castdnn/zero_fraction_1/Size*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0
?
.dnn/zero_fraction_1/counts_to_fraction/truedivRealDiv+dnn/zero_fraction_1/counts_to_fraction/Cast-dnn/zero_fraction_1/counts_to_fraction/Cast_1*
T0*
_output_shapes
: 
y
dnn/zero_fraction_1/fractionIdentity.dnn/zero_fraction_1/counts_to_fraction/truediv*
T0*
_output_shapes
: 
?
2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsConst*
dtype0*
_output_shapes
: *>
value5B3 B-dnn/dnn/hiddenlayer_1/fraction_of_zero_values
?
-dnn/dnn/hiddenlayer_1/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsdnn/zero_fraction_1/fraction*
_output_shapes
: *
T0
?
$dnn/dnn/hiddenlayer_1/activation/tagConst*1
value(B& B dnn/dnn/hiddenlayer_1/activation*
dtype0*
_output_shapes
: 
?
 dnn/dnn/hiddenlayer_1/activationHistogramSummary$dnn/dnn/hiddenlayer_1/activation/tag-dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1*
T0*
_output_shapes
: 
?
@dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"      *2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0
?
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/minConst*
valueB
 *?-ξ*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes
: 
?
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/maxConst*
valueB
 *?-?>*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes
: 
?
Hdnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/shape*
seedޱ?	*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
seed2?*
dtype0*
_output_shapes

:
?
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
_output_shapes
: 
?
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/sub*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
_output_shapes

:
?
:dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
_output_shapes

:
?
dnn/hiddenlayer_2/kernel/part_0VarHandleOp*
shape
:*
dtype0*
_output_shapes
: *0
shared_name!dnn/hiddenlayer_2/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
	container 
?
@dnn/hiddenlayer_2/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_2/kernel/part_0*
_output_shapes
: 
?
&dnn/hiddenlayer_2/kernel/part_0/AssignAssignVariableOpdnn/hiddenlayer_2/kernel/part_0:dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0
?
3dnn/hiddenlayer_2/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes

:
?
/dnn/hiddenlayer_2/bias/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0
?
dnn/hiddenlayer_2/bias/part_0VarHandleOp*
dtype0*
_output_shapes
: *.
shared_namednn/hiddenlayer_2/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
	container *
shape:
?
>dnn/hiddenlayer_2/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_2/bias/part_0*
_output_shapes
: 
?
$dnn/hiddenlayer_2/bias/part_0/AssignAssignVariableOpdnn/hiddenlayer_2/bias/part_0/dnn/hiddenlayer_2/bias/part_0/Initializer/zeros*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
dtype0
?
1dnn/hiddenlayer_2/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
dtype0*
_output_shapes
:
?
'dnn/hiddenlayer_2/kernel/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes

:
v
dnn/hiddenlayer_2/kernelIdentity'dnn/hiddenlayer_2/kernel/ReadVariableOp*
T0*
_output_shapes

:
?
dnn/hiddenlayer_2/MatMulMatMul-dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1dnn/hiddenlayer_2/kernel*
transpose_b( *
T0*'
_output_shapes
:?????????*
transpose_a( 

%dnn/hiddenlayer_2/bias/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0*
dtype0*
_output_shapes
:
n
dnn/hiddenlayer_2/biasIdentity%dnn/hiddenlayer_2/bias/ReadVariableOp*
T0*
_output_shapes
:
?
dnn/hiddenlayer_2/BiasAddBiasAdddnn/hiddenlayer_2/MatMuldnn/hiddenlayer_2/bias*
data_formatNHWC*'
_output_shapes
:?????????*
T0
k
dnn/hiddenlayer_2/ReluReludnn/hiddenlayer_2/BiasAdd*'
_output_shapes
:?????????*
T0
?
;dnn/hiddenlayer_2/batchnorm_2/gamma/part_0/Initializer/onesConst*
valueB*  ??*=
_class3
1/loc:@dnn/hiddenlayer_2/batchnorm_2/gamma/part_0*
dtype0*
_output_shapes
:
?
*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0VarHandleOp*
dtype0*
_output_shapes
: *;
shared_name,*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0*=
_class3
1/loc:@dnn/hiddenlayer_2/batchnorm_2/gamma/part_0*
	container *
shape:
?
Kdnn/hiddenlayer_2/batchnorm_2/gamma/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0*
_output_shapes
: 
?
1dnn/hiddenlayer_2/batchnorm_2/gamma/part_0/AssignAssignVariableOp*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0;dnn/hiddenlayer_2/batchnorm_2/gamma/part_0/Initializer/ones*=
_class3
1/loc:@dnn/hiddenlayer_2/batchnorm_2/gamma/part_0*
dtype0
?
>dnn/hiddenlayer_2/batchnorm_2/gamma/part_0/Read/ReadVariableOpReadVariableOp*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0*=
_class3
1/loc:@dnn/hiddenlayer_2/batchnorm_2/gamma/part_0*
dtype0*
_output_shapes
:
?
;dnn/hiddenlayer_2/batchnorm_2/beta/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *<
_class2
0.loc:@dnn/hiddenlayer_2/batchnorm_2/beta/part_0
?
)dnn/hiddenlayer_2/batchnorm_2/beta/part_0VarHandleOp*:
shared_name+)dnn/hiddenlayer_2/batchnorm_2/beta/part_0*<
_class2
0.loc:@dnn/hiddenlayer_2/batchnorm_2/beta/part_0*
	container *
shape:*
dtype0*
_output_shapes
: 
?
Jdnn/hiddenlayer_2/batchnorm_2/beta/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp)dnn/hiddenlayer_2/batchnorm_2/beta/part_0*
_output_shapes
: 
?
0dnn/hiddenlayer_2/batchnorm_2/beta/part_0/AssignAssignVariableOp)dnn/hiddenlayer_2/batchnorm_2/beta/part_0;dnn/hiddenlayer_2/batchnorm_2/beta/part_0/Initializer/zeros*<
_class2
0.loc:@dnn/hiddenlayer_2/batchnorm_2/beta/part_0*
dtype0
?
=dnn/hiddenlayer_2/batchnorm_2/beta/part_0/Read/ReadVariableOpReadVariableOp)dnn/hiddenlayer_2/batchnorm_2/beta/part_0*<
_class2
0.loc:@dnn/hiddenlayer_2/batchnorm_2/beta/part_0*
dtype0*
_output_shapes
:
?
;dnn/hiddenlayer_2/batchnorm_2/moving_mean/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *<
_class2
0.loc:@dnn/hiddenlayer_2/batchnorm_2/moving_mean
?
)dnn/hiddenlayer_2/batchnorm_2/moving_meanVarHandleOp*
dtype0*
_output_shapes
: *:
shared_name+)dnn/hiddenlayer_2/batchnorm_2/moving_mean*<
_class2
0.loc:@dnn/hiddenlayer_2/batchnorm_2/moving_mean*
	container *
shape:
?
Jdnn/hiddenlayer_2/batchnorm_2/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp)dnn/hiddenlayer_2/batchnorm_2/moving_mean*
_output_shapes
: 
?
0dnn/hiddenlayer_2/batchnorm_2/moving_mean/AssignAssignVariableOp)dnn/hiddenlayer_2/batchnorm_2/moving_mean;dnn/hiddenlayer_2/batchnorm_2/moving_mean/Initializer/zeros*<
_class2
0.loc:@dnn/hiddenlayer_2/batchnorm_2/moving_mean*
dtype0
?
=dnn/hiddenlayer_2/batchnorm_2/moving_mean/Read/ReadVariableOpReadVariableOp)dnn/hiddenlayer_2/batchnorm_2/moving_mean*
dtype0*
_output_shapes
:*<
_class2
0.loc:@dnn/hiddenlayer_2/batchnorm_2/moving_mean
?
>dnn/hiddenlayer_2/batchnorm_2/moving_variance/Initializer/onesConst*
valueB*  ??*@
_class6
42loc:@dnn/hiddenlayer_2/batchnorm_2/moving_variance*
dtype0*
_output_shapes
:
?
-dnn/hiddenlayer_2/batchnorm_2/moving_varianceVarHandleOp*
	container *
shape:*
dtype0*
_output_shapes
: *>
shared_name/-dnn/hiddenlayer_2/batchnorm_2/moving_variance*@
_class6
42loc:@dnn/hiddenlayer_2/batchnorm_2/moving_variance
?
Ndnn/hiddenlayer_2/batchnorm_2/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp-dnn/hiddenlayer_2/batchnorm_2/moving_variance*
_output_shapes
: 
?
4dnn/hiddenlayer_2/batchnorm_2/moving_variance/AssignAssignVariableOp-dnn/hiddenlayer_2/batchnorm_2/moving_variance>dnn/hiddenlayer_2/batchnorm_2/moving_variance/Initializer/ones*
dtype0*@
_class6
42loc:@dnn/hiddenlayer_2/batchnorm_2/moving_variance
?
Adnn/hiddenlayer_2/batchnorm_2/moving_variance/Read/ReadVariableOpReadVariableOp-dnn/hiddenlayer_2/batchnorm_2/moving_variance*
dtype0*
_output_shapes
:*@
_class6
42loc:@dnn/hiddenlayer_2/batchnorm_2/moving_variance
?
1dnn/hiddenlayer_2/batchnorm_2/beta/ReadVariableOpReadVariableOp)dnn/hiddenlayer_2/batchnorm_2/beta/part_0*
dtype0*
_output_shapes
:
?
"dnn/hiddenlayer_2/batchnorm_2/betaIdentity1dnn/hiddenlayer_2/batchnorm_2/beta/ReadVariableOp*
_output_shapes
:*
T0
?
6dnn/hiddenlayer_2/batchnorm_2/batchnorm/ReadVariableOpReadVariableOp-dnn/hiddenlayer_2/batchnorm_2/moving_variance*
dtype0*
_output_shapes
:
r
-dnn/hiddenlayer_2/batchnorm_2/batchnorm/add/yConst*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
+dnn/hiddenlayer_2/batchnorm_2/batchnorm/addAdd6dnn/hiddenlayer_2/batchnorm_2/batchnorm/ReadVariableOp-dnn/hiddenlayer_2/batchnorm_2/batchnorm/add/y*
T0*
_output_shapes
:
?
-dnn/hiddenlayer_2/batchnorm_2/batchnorm/RsqrtRsqrt+dnn/hiddenlayer_2/batchnorm_2/batchnorm/add*
T0*
_output_shapes
:
?
2dnn/hiddenlayer_2/batchnorm_2/gamma/ReadVariableOpReadVariableOp*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0*
dtype0*
_output_shapes
:
?
#dnn/hiddenlayer_2/batchnorm_2/gammaIdentity2dnn/hiddenlayer_2/batchnorm_2/gamma/ReadVariableOp*
T0*
_output_shapes
:
?
+dnn/hiddenlayer_2/batchnorm_2/batchnorm/mulMul-dnn/hiddenlayer_2/batchnorm_2/batchnorm/Rsqrt#dnn/hiddenlayer_2/batchnorm_2/gamma*
T0*
_output_shapes
:
?
-dnn/hiddenlayer_2/batchnorm_2/batchnorm/mul_1Muldnn/hiddenlayer_2/Relu+dnn/hiddenlayer_2/batchnorm_2/batchnorm/mul*'
_output_shapes
:?????????*
T0
?
8dnn/hiddenlayer_2/batchnorm_2/batchnorm/ReadVariableOp_1ReadVariableOp)dnn/hiddenlayer_2/batchnorm_2/moving_mean*
dtype0*
_output_shapes
:
?
-dnn/hiddenlayer_2/batchnorm_2/batchnorm/mul_2Mul8dnn/hiddenlayer_2/batchnorm_2/batchnorm/ReadVariableOp_1+dnn/hiddenlayer_2/batchnorm_2/batchnorm/mul*
T0*
_output_shapes
:
?
+dnn/hiddenlayer_2/batchnorm_2/batchnorm/subSub"dnn/hiddenlayer_2/batchnorm_2/beta-dnn/hiddenlayer_2/batchnorm_2/batchnorm/mul_2*
T0*
_output_shapes
:
?
-dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1Add-dnn/hiddenlayer_2/batchnorm_2/batchnorm/mul_1+dnn/hiddenlayer_2/batchnorm_2/batchnorm/sub*
T0*'
_output_shapes
:?????????
?
dnn/zero_fraction_2/SizeSize-dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1*
T0*
out_type0	*
_output_shapes
: 
e
dnn/zero_fraction_2/LessEqual/yConst*
valueB	 R????*
dtype0	*
_output_shapes
: 
?
dnn/zero_fraction_2/LessEqual	LessEqualdnn/zero_fraction_2/Sizednn/zero_fraction_2/LessEqual/y*
T0	*
_output_shapes
: 
?
dnn/zero_fraction_2/cond/SwitchSwitchdnn/zero_fraction_2/LessEqualdnn/zero_fraction_2/LessEqual*
T0
*
_output_shapes
: : 
q
!dnn/zero_fraction_2/cond/switch_tIdentity!dnn/zero_fraction_2/cond/Switch:1*
_output_shapes
: *
T0

o
!dnn/zero_fraction_2/cond/switch_fIdentitydnn/zero_fraction_2/cond/Switch*
_output_shapes
: *
T0

l
 dnn/zero_fraction_2/cond/pred_idIdentitydnn/zero_fraction_2/LessEqual*
T0
*
_output_shapes
: 
?
,dnn/zero_fraction_2/cond/count_nonzero/zerosConst"^dnn/zero_fraction_2/cond/switch_t*
valueB
 *    *
dtype0*
_output_shapes
: 
?
/dnn/zero_fraction_2/cond/count_nonzero/NotEqualNotEqual8dnn/zero_fraction_2/cond/count_nonzero/NotEqual/Switch:1,dnn/zero_fraction_2/cond/count_nonzero/zeros*
T0*'
_output_shapes
:?????????
?
6dnn/zero_fraction_2/cond/count_nonzero/NotEqual/SwitchSwitch-dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1 dnn/zero_fraction_2/cond/pred_id*
T0*@
_class6
42loc:@dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1*:
_output_shapes(
&:?????????:?????????
?
+dnn/zero_fraction_2/cond/count_nonzero/CastCast/dnn/zero_fraction_2/cond/count_nonzero/NotEqual*

SrcT0
*
Truncate( *'
_output_shapes
:?????????*

DstT0
?
,dnn/zero_fraction_2/cond/count_nonzero/ConstConst"^dnn/zero_fraction_2/cond/switch_t*
valueB"       *
dtype0*
_output_shapes
:
?
4dnn/zero_fraction_2/cond/count_nonzero/nonzero_countSum+dnn/zero_fraction_2/cond/count_nonzero/Cast,dnn/zero_fraction_2/cond/count_nonzero/Const*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
?
dnn/zero_fraction_2/cond/CastCast4dnn/zero_fraction_2/cond/count_nonzero/nonzero_count*
Truncate( *
_output_shapes
: *

DstT0	*

SrcT0
?
.dnn/zero_fraction_2/cond/count_nonzero_1/zerosConst"^dnn/zero_fraction_2/cond/switch_f*
valueB
 *    *
dtype0*
_output_shapes
: 
?
1dnn/zero_fraction_2/cond/count_nonzero_1/NotEqualNotEqual8dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual/Switch.dnn/zero_fraction_2/cond/count_nonzero_1/zeros*'
_output_shapes
:?????????*
T0
?
8dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual/SwitchSwitch-dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1 dnn/zero_fraction_2/cond/pred_id*:
_output_shapes(
&:?????????:?????????*
T0*@
_class6
42loc:@dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1
?
-dnn/zero_fraction_2/cond/count_nonzero_1/CastCast1dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual*

SrcT0
*
Truncate( *'
_output_shapes
:?????????*

DstT0	
?
.dnn/zero_fraction_2/cond/count_nonzero_1/ConstConst"^dnn/zero_fraction_2/cond/switch_f*
valueB"       *
dtype0*
_output_shapes
:
?
6dnn/zero_fraction_2/cond/count_nonzero_1/nonzero_countSum-dnn/zero_fraction_2/cond/count_nonzero_1/Cast.dnn/zero_fraction_2/cond/count_nonzero_1/Const*
T0	*
_output_shapes
: *
	keep_dims( *

Tidx0
?
dnn/zero_fraction_2/cond/MergeMerge6dnn/zero_fraction_2/cond/count_nonzero_1/nonzero_countdnn/zero_fraction_2/cond/Cast*
T0	*
N*
_output_shapes
: : 
?
*dnn/zero_fraction_2/counts_to_fraction/subSubdnn/zero_fraction_2/Sizednn/zero_fraction_2/cond/Merge*
T0	*
_output_shapes
: 
?
+dnn/zero_fraction_2/counts_to_fraction/CastCast*dnn/zero_fraction_2/counts_to_fraction/sub*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0
?
-dnn/zero_fraction_2/counts_to_fraction/Cast_1Castdnn/zero_fraction_2/Size*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0
?
.dnn/zero_fraction_2/counts_to_fraction/truedivRealDiv+dnn/zero_fraction_2/counts_to_fraction/Cast-dnn/zero_fraction_2/counts_to_fraction/Cast_1*
_output_shapes
: *
T0
y
dnn/zero_fraction_2/fractionIdentity.dnn/zero_fraction_2/counts_to_fraction/truediv*
T0*
_output_shapes
: 
?
2dnn/dnn/hiddenlayer_2/fraction_of_zero_values/tagsConst*>
value5B3 B-dnn/dnn/hiddenlayer_2/fraction_of_zero_values*
dtype0*
_output_shapes
: 
?
-dnn/dnn/hiddenlayer_2/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_2/fraction_of_zero_values/tagsdnn/zero_fraction_2/fraction*
T0*
_output_shapes
: 
?
$dnn/dnn/hiddenlayer_2/activation/tagConst*1
value(B& B dnn/dnn/hiddenlayer_2/activation*
dtype0*
_output_shapes
: 
?
 dnn/dnn/hiddenlayer_2/activationHistogramSummary$dnn/dnn/hiddenlayer_2/activation/tag-dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1*
T0*
_output_shapes
: 
?
9dnn/logits/kernel/part_0/Initializer/random_uniform/shapeConst*
valueB"      *+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0*
_output_shapes
:
?
7dnn/logits/kernel/part_0/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *q??*+
_class!
loc:@dnn/logits/kernel/part_0
?
7dnn/logits/kernel/part_0/Initializer/random_uniform/maxConst*
valueB
 *q??*+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0*
_output_shapes
: 
?
Adnn/logits/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform9dnn/logits/kernel/part_0/Initializer/random_uniform/shape*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
seed2?*
dtype0*
_output_shapes

:*
seedޱ?	
?
7dnn/logits/kernel/part_0/Initializer/random_uniform/subSub7dnn/logits/kernel/part_0/Initializer/random_uniform/max7dnn/logits/kernel/part_0/Initializer/random_uniform/min*
_output_shapes
: *
T0*+
_class!
loc:@dnn/logits/kernel/part_0
?
7dnn/logits/kernel/part_0/Initializer/random_uniform/mulMulAdnn/logits/kernel/part_0/Initializer/random_uniform/RandomUniform7dnn/logits/kernel/part_0/Initializer/random_uniform/sub*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
_output_shapes

:
?
3dnn/logits/kernel/part_0/Initializer/random_uniformAdd7dnn/logits/kernel/part_0/Initializer/random_uniform/mul7dnn/logits/kernel/part_0/Initializer/random_uniform/min*
_output_shapes

:*
T0*+
_class!
loc:@dnn/logits/kernel/part_0
?
dnn/logits/kernel/part_0VarHandleOp*+
_class!
loc:@dnn/logits/kernel/part_0*
	container *
shape
:*
dtype0*
_output_shapes
: *)
shared_namednn/logits/kernel/part_0
?
9dnn/logits/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/logits/kernel/part_0*
_output_shapes
: 
?
dnn/logits/kernel/part_0/AssignAssignVariableOpdnn/logits/kernel/part_03dnn/logits/kernel/part_0/Initializer/random_uniform*+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0
?
,dnn/logits/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0*+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0*
_output_shapes

:
?
(dnn/logits/bias/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *)
_class
loc:@dnn/logits/bias/part_0
?
dnn/logits/bias/part_0VarHandleOp*
shape:*
dtype0*
_output_shapes
: *'
shared_namednn/logits/bias/part_0*)
_class
loc:@dnn/logits/bias/part_0*
	container 
}
7dnn/logits/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/logits/bias/part_0*
_output_shapes
: 
?
dnn/logits/bias/part_0/AssignAssignVariableOpdnn/logits/bias/part_0(dnn/logits/bias/part_0/Initializer/zeros*)
_class
loc:@dnn/logits/bias/part_0*
dtype0
?
*dnn/logits/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/logits/bias/part_0*)
_class
loc:@dnn/logits/bias/part_0*
dtype0*
_output_shapes
:
y
 dnn/logits/kernel/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0*
dtype0*
_output_shapes

:
h
dnn/logits/kernelIdentity dnn/logits/kernel/ReadVariableOp*
T0*
_output_shapes

:
?
dnn/logits/MatMulMatMul-dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1dnn/logits/kernel*
T0*'
_output_shapes
:?????????*
transpose_a( *
transpose_b( 
q
dnn/logits/bias/ReadVariableOpReadVariableOpdnn/logits/bias/part_0*
dtype0*
_output_shapes
:
`
dnn/logits/biasIdentitydnn/logits/bias/ReadVariableOp*
_output_shapes
:*
T0
?
dnn/logits/BiasAddBiasAdddnn/logits/MatMuldnn/logits/bias*
data_formatNHWC*'
_output_shapes
:?????????*
T0
e
dnn/zero_fraction_3/SizeSizednn/logits/BiasAdd*
T0*
out_type0	*
_output_shapes
: 
e
dnn/zero_fraction_3/LessEqual/yConst*
valueB	 R????*
dtype0	*
_output_shapes
: 
?
dnn/zero_fraction_3/LessEqual	LessEqualdnn/zero_fraction_3/Sizednn/zero_fraction_3/LessEqual/y*
T0	*
_output_shapes
: 
?
dnn/zero_fraction_3/cond/SwitchSwitchdnn/zero_fraction_3/LessEqualdnn/zero_fraction_3/LessEqual*
_output_shapes
: : *
T0

q
!dnn/zero_fraction_3/cond/switch_tIdentity!dnn/zero_fraction_3/cond/Switch:1*
_output_shapes
: *
T0

o
!dnn/zero_fraction_3/cond/switch_fIdentitydnn/zero_fraction_3/cond/Switch*
T0
*
_output_shapes
: 
l
 dnn/zero_fraction_3/cond/pred_idIdentitydnn/zero_fraction_3/LessEqual*
T0
*
_output_shapes
: 
?
,dnn/zero_fraction_3/cond/count_nonzero/zerosConst"^dnn/zero_fraction_3/cond/switch_t*
valueB
 *    *
dtype0*
_output_shapes
: 
?
/dnn/zero_fraction_3/cond/count_nonzero/NotEqualNotEqual8dnn/zero_fraction_3/cond/count_nonzero/NotEqual/Switch:1,dnn/zero_fraction_3/cond/count_nonzero/zeros*
T0*'
_output_shapes
:?????????
?
6dnn/zero_fraction_3/cond/count_nonzero/NotEqual/SwitchSwitchdnn/logits/BiasAdd dnn/zero_fraction_3/cond/pred_id*
T0*%
_class
loc:@dnn/logits/BiasAdd*:
_output_shapes(
&:?????????:?????????
?
+dnn/zero_fraction_3/cond/count_nonzero/CastCast/dnn/zero_fraction_3/cond/count_nonzero/NotEqual*

SrcT0
*
Truncate( *'
_output_shapes
:?????????*

DstT0
?
,dnn/zero_fraction_3/cond/count_nonzero/ConstConst"^dnn/zero_fraction_3/cond/switch_t*
valueB"       *
dtype0*
_output_shapes
:
?
4dnn/zero_fraction_3/cond/count_nonzero/nonzero_countSum+dnn/zero_fraction_3/cond/count_nonzero/Cast,dnn/zero_fraction_3/cond/count_nonzero/Const*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
?
dnn/zero_fraction_3/cond/CastCast4dnn/zero_fraction_3/cond/count_nonzero/nonzero_count*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0	
?
.dnn/zero_fraction_3/cond/count_nonzero_1/zerosConst"^dnn/zero_fraction_3/cond/switch_f*
valueB
 *    *
dtype0*
_output_shapes
: 
?
1dnn/zero_fraction_3/cond/count_nonzero_1/NotEqualNotEqual8dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual/Switch.dnn/zero_fraction_3/cond/count_nonzero_1/zeros*
T0*'
_output_shapes
:?????????
?
8dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual/SwitchSwitchdnn/logits/BiasAdd dnn/zero_fraction_3/cond/pred_id*:
_output_shapes(
&:?????????:?????????*
T0*%
_class
loc:@dnn/logits/BiasAdd
?
-dnn/zero_fraction_3/cond/count_nonzero_1/CastCast1dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual*

SrcT0
*
Truncate( *'
_output_shapes
:?????????*

DstT0	
?
.dnn/zero_fraction_3/cond/count_nonzero_1/ConstConst"^dnn/zero_fraction_3/cond/switch_f*
valueB"       *
dtype0*
_output_shapes
:
?
6dnn/zero_fraction_3/cond/count_nonzero_1/nonzero_countSum-dnn/zero_fraction_3/cond/count_nonzero_1/Cast.dnn/zero_fraction_3/cond/count_nonzero_1/Const*
T0	*
_output_shapes
: *
	keep_dims( *

Tidx0
?
dnn/zero_fraction_3/cond/MergeMerge6dnn/zero_fraction_3/cond/count_nonzero_1/nonzero_countdnn/zero_fraction_3/cond/Cast*
N*
_output_shapes
: : *
T0	
?
*dnn/zero_fraction_3/counts_to_fraction/subSubdnn/zero_fraction_3/Sizednn/zero_fraction_3/cond/Merge*
T0	*
_output_shapes
: 
?
+dnn/zero_fraction_3/counts_to_fraction/CastCast*dnn/zero_fraction_3/counts_to_fraction/sub*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0
?
-dnn/zero_fraction_3/counts_to_fraction/Cast_1Castdnn/zero_fraction_3/Size*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0
?
.dnn/zero_fraction_3/counts_to_fraction/truedivRealDiv+dnn/zero_fraction_3/counts_to_fraction/Cast-dnn/zero_fraction_3/counts_to_fraction/Cast_1*
T0*
_output_shapes
: 
y
dnn/zero_fraction_3/fractionIdentity.dnn/zero_fraction_3/counts_to_fraction/truediv*
_output_shapes
: *
T0
?
+dnn/dnn/logits/fraction_of_zero_values/tagsConst*7
value.B, B&dnn/dnn/logits/fraction_of_zero_values*
dtype0*
_output_shapes
: 
?
&dnn/dnn/logits/fraction_of_zero_valuesScalarSummary+dnn/dnn/logits/fraction_of_zero_values/tagsdnn/zero_fraction_3/fraction*
T0*
_output_shapes
: 
w
dnn/dnn/logits/activation/tagConst**
value!B Bdnn/dnn/logits/activation*
dtype0*
_output_shapes
: 
?
dnn/dnn/logits/activationHistogramSummarydnn/dnn/logits/activation/tagdnn/logits/BiasAdd*
_output_shapes
: *
T0
c
head/logits/ShapeShapednn/logits/BiasAdd*
T0*
out_type0*
_output_shapes
:
g
%head/logits/assert_rank_at_least/rankConst*
value	B :*
dtype0*
_output_shapes
: 
W
Ohead/logits/assert_rank_at_least/assert_type/statically_determined_correct_typeNoOp
H
@head/logits/assert_rank_at_least/static_checks_determined_all_okNoOp
e
head/labels/ExpandDims/dimConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
?
head/labels/ExpandDims
ExpandDimsIteratorGetNext:9head/labels/ExpandDims/dim*'
_output_shapes
:?????????*

Tdim0*
T0
g
head/labels/ShapeShapehead/labels/ExpandDims*
_output_shapes
:*
T0*
out_type0
e
head/labels/Shape_1Shapednn/logits/BiasAdd*
_output_shapes
:*
T0*
out_type0
g
%head/labels/assert_rank_at_least/rankConst*
value	B :*
dtype0*
_output_shapes
: 
|
&head/labels/assert_rank_at_least/ShapeShapehead/labels/ExpandDims*
T0*
out_type0*
_output_shapes
:
W
Ohead/labels/assert_rank_at_least/assert_type/statically_determined_correct_typeNoOp
H
@head/labels/assert_rank_at_least/static_checks_determined_all_okNoOp
?
head/labels/strided_slice/stackConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB: *
dtype0*
_output_shapes
:
?
!head/labels/strided_slice/stack_1ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB:
?????????*
dtype0*
_output_shapes
:
?
!head/labels/strided_slice/stack_2ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB:*
dtype0*
_output_shapes
:
?
head/labels/strided_sliceStridedSlicehead/labels/Shape_1head/labels/strided_slice/stack!head/labels/strided_slice/stack_1!head/labels/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
:
?
head/labels/concat/values_1ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB:*
dtype0*
_output_shapes
:
?
head/labels/concat/axisConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
value	B : *
dtype0*
_output_shapes
: 
?
head/labels/concatConcatV2head/labels/strided_slicehead/labels/concat/values_1head/labels/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
s
head/labels/assert_equal/EqualEqualhead/labels/concathead/labels/Shape*
T0*
_output_shapes
:
?
head/labels/assert_equal/ConstConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB: *
dtype0*
_output_shapes
:
?
head/labels/assert_equal/AllAllhead/labels/assert_equal/Equalhead/labels/assert_equal/Const*
_output_shapes
: *
	keep_dims( *

Tidx0
?
%head/labels/assert_equal/Assert/ConstConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
dtype0*
_output_shapes
: *(
valueB Bexpected_labels_shape: 
?
'head/labels/assert_equal/Assert/Const_1ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB Blabels_shape: *
dtype0*
_output_shapes
: 
?
-head/labels/assert_equal/Assert/Assert/data_0ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*(
valueB Bexpected_labels_shape: *
dtype0*
_output_shapes
: 
?
-head/labels/assert_equal/Assert/Assert/data_2ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB Blabels_shape: *
dtype0*
_output_shapes
: 
?
&head/labels/assert_equal/Assert/AssertAsserthead/labels/assert_equal/All-head/labels/assert_equal/Assert/Assert/data_0head/labels/concat-head/labels/assert_equal/Assert/Assert/data_2head/labels/Shape*
T
2*
	summarize
?
head/labelsIdentityhead/labels/ExpandDims'^head/labels/assert_equal/Assert/AssertA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*'
_output_shapes
:?????????*
T0
?
)head/mean_squared_error/SquaredDifferenceSquaredDifferencednn/logits/BiasAddhead/labels*
T0*'
_output_shapes
:?????????
y
4head/mean_squared_error/assert_broadcastable/weightsConst*
valueB
 *  ??*
dtype0*
_output_shapes
: 
}
:head/mean_squared_error/assert_broadcastable/weights/shapeConst*
dtype0*
_output_shapes
: *
valueB 
{
9head/mean_squared_error/assert_broadcastable/weights/rankConst*
value	B : *
dtype0*
_output_shapes
: 
?
9head/mean_squared_error/assert_broadcastable/values/shapeShape)head/mean_squared_error/SquaredDifference*
T0*
out_type0*
_output_shapes
:
z
8head/mean_squared_error/assert_broadcastable/values/rankConst*
value	B :*
dtype0*
_output_shapes
: 
P
Hhead/mean_squared_error/assert_broadcastable/static_scalar_check_successNoOp
?
!head/mean_squared_error/ToFloat/xConstI^head/mean_squared_error/assert_broadcastable/static_scalar_check_success*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
head/mean_squared_error/MulMul)head/mean_squared_error/SquaredDifference!head/mean_squared_error/ToFloat/x*'
_output_shapes
:?????????*
T0
t
/head/weighted_loss/assert_broadcastable/weightsConst*
valueB
 *  ??*
dtype0*
_output_shapes
: 
x
5head/weighted_loss/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 
v
4head/weighted_loss/assert_broadcastable/weights/rankConst*
value	B : *
dtype0*
_output_shapes
: 
?
4head/weighted_loss/assert_broadcastable/values/shapeShapehead/mean_squared_error/Mul*
T0*
out_type0*
_output_shapes
:
u
3head/weighted_loss/assert_broadcastable/values/rankConst*
value	B :*
dtype0*
_output_shapes
: 
K
Chead/weighted_loss/assert_broadcastable/static_scalar_check_successNoOp
?
head/weighted_loss/ToFloat/xConstD^head/weighted_loss/assert_broadcastable/static_scalar_check_success*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
head/weighted_loss/MulMulhead/mean_squared_error/Mulhead/weighted_loss/ToFloat/x*
T0*'
_output_shapes
:?????????
?
head/weighted_loss/ConstConstD^head/weighted_loss/assert_broadcastable/static_scalar_check_success*
valueB"       *
dtype0*
_output_shapes
:
?
head/weighted_loss/SumSumhead/weighted_loss/Mulhead/weighted_loss/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
?
mean/total/Initializer/zerosConst*
valueB
 *    *
_class
loc:@mean/total*
dtype0*
_output_shapes
: 
?

mean/total
VariableV2*
dtype0*
_output_shapes
: *
shared_name *
_class
loc:@mean/total*
	container *
shape: 
?
mean/total/AssignAssign
mean/totalmean/total/Initializer/zeros*
use_locking(*
T0*
_class
loc:@mean/total*
validate_shape(*
_output_shapes
: 
g
mean/total/readIdentity
mean/total*
T0*
_class
loc:@mean/total*
_output_shapes
: 
?
mean/count/Initializer/zerosConst*
dtype0*
_output_shapes
: *
valueB
 *    *
_class
loc:@mean/count
?

mean/count
VariableV2*
shared_name *
_class
loc:@mean/count*
	container *
shape: *
dtype0*
_output_shapes
: 
?
mean/count/AssignAssign
mean/countmean/count/Initializer/zeros*
use_locking(*
T0*
_class
loc:@mean/count*
validate_shape(*
_output_shapes
: 
g
mean/count/readIdentity
mean/count*
T0*
_class
loc:@mean/count*
_output_shapes
: 
O

mean/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  ??
|
9mean/broadcast_weights/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 
z
8mean/broadcast_weights/assert_broadcastable/weights/rankConst*
value	B : *
dtype0*
_output_shapes
: 
?
8mean/broadcast_weights/assert_broadcastable/values/shapeShapehead/mean_squared_error/Mul*
T0*
out_type0*
_output_shapes
:
y
7mean/broadcast_weights/assert_broadcastable/values/rankConst*
value	B :*
dtype0*
_output_shapes
: 
O
Gmean/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOp
?
&mean/broadcast_weights/ones_like/ShapeShapehead/mean_squared_error/MulH^mean/broadcast_weights/assert_broadcastable/static_scalar_check_success*
T0*
out_type0*
_output_shapes
:
?
&mean/broadcast_weights/ones_like/ConstConstH^mean/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
 mean/broadcast_weights/ones_likeFill&mean/broadcast_weights/ones_like/Shape&mean/broadcast_weights/ones_like/Const*
T0*

index_type0*'
_output_shapes
:?????????
}
mean/broadcast_weightsMul
mean/Const mean/broadcast_weights/ones_like*
T0*'
_output_shapes
:?????????
v
mean/MulMulhead/mean_squared_error/Mulmean/broadcast_weights*
T0*'
_output_shapes
:?????????
]
mean/Const_1Const*
valueB"       *
dtype0*
_output_shapes
:
s
mean/SumSummean/broadcast_weightsmean/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
]
mean/Const_2Const*
dtype0*
_output_shapes
:*
valueB"       
g

mean/Sum_1Summean/Mulmean/Const_2*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
?
mean/AssignAdd	AssignAdd
mean/total
mean/Sum_1*
_output_shapes
: *
use_locking( *
T0*
_class
loc:@mean/total
?
mean/AssignAdd_1	AssignAdd
mean/countmean/Sum	^mean/Mul*
use_locking( *
T0*
_class
loc:@mean/count*
_output_shapes
: 
S
mean/Maximum/yConst*
dtype0*
_output_shapes
: *
valueB
 *    
Y
mean/MaximumMaximummean/count/readmean/Maximum/y*
_output_shapes
: *
T0
V

mean/valueDivNoNanmean/total/readmean/Maximum*
T0*
_output_shapes
: 
U
mean/Maximum_1/yConst*
valueB
 *    *
dtype0*
_output_shapes
: 
^
mean/Maximum_1Maximummean/AssignAdd_1mean/Maximum_1/y*
T0*
_output_shapes
: 
[
mean/update_opDivNoNanmean/AssignAddmean/Maximum_1*
T0*
_output_shapes
: 
n
)prediction/mean/broadcast_weights/weightsConst*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Dprediction/mean/broadcast_weights/assert_broadcastable/weights/shapeConst*
dtype0*
_output_shapes
: *
valueB 
?
Cprediction/mean/broadcast_weights/assert_broadcastable/weights/rankConst*
value	B : *
dtype0*
_output_shapes
: 
?
Cprediction/mean/broadcast_weights/assert_broadcastable/values/shapeShapednn/logits/BiasAdd*
_output_shapes
:*
T0*
out_type0
?
Bprediction/mean/broadcast_weights/assert_broadcastable/values/rankConst*
dtype0*
_output_shapes
: *
value	B :
Z
Rprediction/mean/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOp
?
1prediction/mean/broadcast_weights/ones_like/ShapeShapednn/logits/BiasAddS^prediction/mean/broadcast_weights/assert_broadcastable/static_scalar_check_success*
_output_shapes
:*
T0*
out_type0
?
1prediction/mean/broadcast_weights/ones_like/ConstConstS^prediction/mean/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
+prediction/mean/broadcast_weights/ones_likeFill1prediction/mean/broadcast_weights/ones_like/Shape1prediction/mean/broadcast_weights/ones_like/Const*
T0*

index_type0*'
_output_shapes
:?????????
?
!prediction/mean/broadcast_weightsMul)prediction/mean/broadcast_weights/weights+prediction/mean/broadcast_weights/ones_like*
T0*'
_output_shapes
:?????????
?
'prediction/mean/total/Initializer/zerosConst*
valueB
 *    *(
_class
loc:@prediction/mean/total*
dtype0*
_output_shapes
: 
?
prediction/mean/total
VariableV2*
shared_name *(
_class
loc:@prediction/mean/total*
	container *
shape: *
dtype0*
_output_shapes
: 
?
prediction/mean/total/AssignAssignprediction/mean/total'prediction/mean/total/Initializer/zeros*
T0*(
_class
loc:@prediction/mean/total*
validate_shape(*
_output_shapes
: *
use_locking(
?
prediction/mean/total/readIdentityprediction/mean/total*
T0*(
_class
loc:@prediction/mean/total*
_output_shapes
: 
?
'prediction/mean/count/Initializer/zerosConst*
valueB
 *    *(
_class
loc:@prediction/mean/count*
dtype0*
_output_shapes
: 
?
prediction/mean/count
VariableV2*
shared_name *(
_class
loc:@prediction/mean/count*
	container *
shape: *
dtype0*
_output_shapes
: 
?
prediction/mean/count/AssignAssignprediction/mean/count'prediction/mean/count/Initializer/zeros*
T0*(
_class
loc:@prediction/mean/count*
validate_shape(*
_output_shapes
: *
use_locking(
?
prediction/mean/count/readIdentityprediction/mean/count*
T0*(
_class
loc:@prediction/mean/count*
_output_shapes
: 
?
Fprediction/mean/broadcast_weights_1/assert_broadcastable/weights/shapeShape!prediction/mean/broadcast_weights*
T0*
out_type0*
_output_shapes
:
?
Eprediction/mean/broadcast_weights_1/assert_broadcastable/weights/rankConst*
value	B :*
dtype0*
_output_shapes
: 
?
Eprediction/mean/broadcast_weights_1/assert_broadcastable/values/shapeShapednn/logits/BiasAdd*
T0*
out_type0*
_output_shapes
:
?
Dprediction/mean/broadcast_weights_1/assert_broadcastable/values/rankConst*
value	B :*
dtype0*
_output_shapes
: 
?
Dprediction/mean/broadcast_weights_1/assert_broadcastable/is_scalar/xConst*
value	B : *
dtype0*
_output_shapes
: 
?
Bprediction/mean/broadcast_weights_1/assert_broadcastable/is_scalarEqualDprediction/mean/broadcast_weights_1/assert_broadcastable/is_scalar/xEprediction/mean/broadcast_weights_1/assert_broadcastable/weights/rank*
T0*
_output_shapes
: 
?
Nprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/SwitchSwitchBprediction/mean/broadcast_weights_1/assert_broadcastable/is_scalarBprediction/mean/broadcast_weights_1/assert_broadcastable/is_scalar*
T0
*
_output_shapes
: : 
?
Pprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/switch_tIdentityPprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/Switch:1*
T0
*
_output_shapes
: 
?
Pprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/switch_fIdentityNprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/Switch*
T0
*
_output_shapes
: 
?
Oprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/pred_idIdentityBprediction/mean/broadcast_weights_1/assert_broadcastable/is_scalar*
T0
*
_output_shapes
: 
?
Pprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/Switch_1SwitchBprediction/mean/broadcast_weights_1/assert_broadcastable/is_scalarOprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/pred_id*
T0
*U
_classK
IGloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/is_scalar*
_output_shapes
: : 
?
nprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rankEqualuprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rank/Switchwprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rank/Switch_1*
T0*
_output_shapes
: 
?
uprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rank/SwitchSwitchDprediction/mean/broadcast_weights_1/assert_broadcastable/values/rankOprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/pred_id*
T0*W
_classM
KIloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/values/rank*
_output_shapes
: : 
?
wprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rank/Switch_1SwitchEprediction/mean/broadcast_weights_1/assert_broadcastable/weights/rankOprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/pred_id*
T0*X
_classN
LJloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/weights/rank*
_output_shapes
: : 
?
hprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/SwitchSwitchnprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_ranknprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rank*
T0
*
_output_shapes
: : 
?
jprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/switch_tIdentityjprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/Switch:1*
T0
*
_output_shapes
: 
?
jprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/switch_fIdentityhprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/Switch*
_output_shapes
: *
T0

?
iprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/pred_idIdentitynprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rank*
T0
*
_output_shapes
: 
?
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims/dimConstk^prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/switch_t*
dtype0*
_output_shapes
: *
valueB :
?????????
?
}prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims
ExpandDims?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims/Switch_1:1?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims/dim*

Tdim0*
T0*
_output_shapes

:
?
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims/SwitchSwitchEprediction/mean/broadcast_weights_1/assert_broadcastable/values/shapeOprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/pred_id*
T0*X
_classN
LJloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/values/shape* 
_output_shapes
::
?
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims/Switch_1Switch?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims/Switchiprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/pred_id*
T0*X
_classN
LJloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/values/shape* 
_output_shapes
::
?
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ones_like/ShapeConstk^prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/switch_t*
valueB"      *
dtype0*
_output_shapes
:
?
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ones_like/ConstConstk^prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/switch_t*
value	B :*
dtype0*
_output_shapes
: 
?
|prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ones_likeFill?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ones_like/Shape?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ones_like/Const*
T0*

index_type0*
_output_shapes

:
?
~prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/concat/axisConstk^prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/switch_t*
value	B :*
dtype0*
_output_shapes
: 
?
yprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/concatConcatV2}prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims|prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ones_like~prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/concat/axis*

Tidx0*
T0*
N*
_output_shapes

:
?
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1/dimConstk^prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/switch_t*
valueB :
?????????*
dtype0*
_output_shapes
: 
?
prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1
ExpandDims?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1/Switch_1:1?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1/dim*
T0*
_output_shapes

:*

Tdim0
?
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1/SwitchSwitchFprediction/mean/broadcast_weights_1/assert_broadcastable/weights/shapeOprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/pred_id* 
_output_shapes
::*
T0*Y
_classO
MKloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/weights/shape
?
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1/Switch_1Switch?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1/Switchiprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/pred_id*
T0*Y
_classO
MKloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/weights/shape* 
_output_shapes
::
?
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/DenseToDenseSetOperationDenseToDenseSetOperationprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1yprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/concat*<
_output_shapes*
(:?????????:?????????:*
set_operationa-b*
validate_indices(*
T0
?
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/num_invalid_dimsSize?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/DenseToDenseSetOperation:1*
T0*
out_type0*
_output_shapes
: 
?
tprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/xConstk^prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/switch_t*
dtype0*
_output_shapes
: *
value	B : 
?
rprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dimsEqualtprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/x?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/num_invalid_dims*
T0*
_output_shapes
: 
?
jprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/Switch_1Switchnprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rankiprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/pred_id*
T0
*?
_classw
usloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rank*
_output_shapes
: : 
?
gprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/MergeMergejprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/Switch_1rprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims*
T0
*
N*
_output_shapes
: : 
?
Mprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/MergeMergegprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/MergeRprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/Switch_1:1*
T0
*
N*
_output_shapes
: : 
?
>prediction/mean/broadcast_weights_1/assert_broadcastable/ConstConst*8
value/B- B'weights can not be broadcast to values.*
dtype0*
_output_shapes
: 
?
@prediction/mean/broadcast_weights_1/assert_broadcastable/Const_1Const*
valueB Bweights.shape=*
dtype0*
_output_shapes
: 
?
@prediction/mean/broadcast_weights_1/assert_broadcastable/Const_2Const*
dtype0*
_output_shapes
: *4
value+B) B#prediction/mean/broadcast_weights:0
?
@prediction/mean/broadcast_weights_1/assert_broadcastable/Const_3Const*
dtype0*
_output_shapes
: *
valueB Bvalues.shape=
?
@prediction/mean/broadcast_weights_1/assert_broadcastable/Const_4Const*
dtype0*
_output_shapes
: *%
valueB Bdnn/logits/BiasAdd:0
?
@prediction/mean/broadcast_weights_1/assert_broadcastable/Const_5Const*
valueB B
is_scalar=*
dtype0*
_output_shapes
: 
?
Kprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/SwitchSwitchMprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/MergeMprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/Merge*
T0
*
_output_shapes
: : 
?
Mprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_tIdentityMprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Switch:1*
T0
*
_output_shapes
: 
?
Mprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_fIdentityKprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Switch*
T0
*
_output_shapes
: 
?
Lprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/pred_idIdentityMprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/Merge*
T0
*
_output_shapes
: 
?
Iprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/NoOpNoOpN^prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_t
?
Wprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/control_dependencyIdentityMprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_tJ^prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/NoOp*
T0
*`
_classV
TRloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_t*
_output_shapes
: 
?
Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_0ConstN^prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_f*8
value/B- B'weights can not be broadcast to values.*
dtype0*
_output_shapes
: 
?
Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_1ConstN^prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_f*
valueB Bweights.shape=*
dtype0*
_output_shapes
: 
?
Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_2ConstN^prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_f*4
value+B) B#prediction/mean/broadcast_weights:0*
dtype0*
_output_shapes
: 
?
Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_4ConstN^prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_f*
valueB Bvalues.shape=*
dtype0*
_output_shapes
: 
?
Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_5ConstN^prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_f*%
valueB Bdnn/logits/BiasAdd:0*
dtype0*
_output_shapes
: 
?
Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_7ConstN^prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_f*
valueB B
is_scalar=*
dtype0*
_output_shapes
: 
?
Kprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/AssertAssertRprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/SwitchRprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_0Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_1Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_2Tprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/Switch_1Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_4Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_5Tprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/Switch_2Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_7Tprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/Switch_3*
T
2	
*
	summarize
?
Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/SwitchSwitchMprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/MergeLprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/pred_id*
T0
*`
_classV
TRloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/Merge*
_output_shapes
: : 
?
Tprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/Switch_1SwitchFprediction/mean/broadcast_weights_1/assert_broadcastable/weights/shapeLprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/pred_id*
T0*Y
_classO
MKloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/weights/shape* 
_output_shapes
::
?
Tprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/Switch_2SwitchEprediction/mean/broadcast_weights_1/assert_broadcastable/values/shapeLprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/pred_id*
T0*X
_classN
LJloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/values/shape* 
_output_shapes
::
?
Tprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/Switch_3SwitchBprediction/mean/broadcast_weights_1/assert_broadcastable/is_scalarLprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/pred_id*
T0
*U
_classK
IGloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/is_scalar*
_output_shapes
: : 
?
Yprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/control_dependency_1IdentityMprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_fL^prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert*
T0
*`
_classV
TRloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_f*
_output_shapes
: 
?
Jprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/MergeMergeYprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/control_dependency_1Wprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/control_dependency*
T0
*
N*
_output_shapes
: : 
?
3prediction/mean/broadcast_weights_1/ones_like/ShapeShapednn/logits/BiasAddK^prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Merge*
_output_shapes
:*
T0*
out_type0
?
3prediction/mean/broadcast_weights_1/ones_like/ConstConstK^prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Merge*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
-prediction/mean/broadcast_weights_1/ones_likeFill3prediction/mean/broadcast_weights_1/ones_like/Shape3prediction/mean/broadcast_weights_1/ones_like/Const*'
_output_shapes
:?????????*
T0*

index_type0
?
#prediction/mean/broadcast_weights_1Mul!prediction/mean/broadcast_weights-prediction/mean/broadcast_weights_1/ones_like*
T0*'
_output_shapes
:?????????
?
prediction/mean/MulMuldnn/logits/BiasAdd#prediction/mean/broadcast_weights_1*
T0*'
_output_shapes
:?????????
f
prediction/mean/ConstConst*
valueB"       *
dtype0*
_output_shapes
:
?
prediction/mean/SumSum#prediction/mean/broadcast_weights_1prediction/mean/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
h
prediction/mean/Const_1Const*
valueB"       *
dtype0*
_output_shapes
:
?
prediction/mean/Sum_1Sumprediction/mean/Mulprediction/mean/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
?
prediction/mean/AssignAdd	AssignAddprediction/mean/totalprediction/mean/Sum_1*
use_locking( *
T0*(
_class
loc:@prediction/mean/total*
_output_shapes
: 
?
prediction/mean/AssignAdd_1	AssignAddprediction/mean/countprediction/mean/Sum^prediction/mean/Mul*
_output_shapes
: *
use_locking( *
T0*(
_class
loc:@prediction/mean/count
^
prediction/mean/Maximum/yConst*
dtype0*
_output_shapes
: *
valueB
 *    
z
prediction/mean/MaximumMaximumprediction/mean/count/readprediction/mean/Maximum/y*
T0*
_output_shapes
: 
w
prediction/mean/valueDivNoNanprediction/mean/total/readprediction/mean/Maximum*
T0*
_output_shapes
: 
`
prediction/mean/Maximum_1/yConst*
valueB
 *    *
dtype0*
_output_shapes
: 

prediction/mean/Maximum_1Maximumprediction/mean/AssignAdd_1prediction/mean/Maximum_1/y*
T0*
_output_shapes
: 
|
prediction/mean/update_opDivNoNanprediction/mean/AssignAddprediction/mean/Maximum_1*
T0*
_output_shapes
: 
?
mean_1/total/Initializer/zerosConst*
valueB
 *    *
_class
loc:@mean_1/total*
dtype0*
_output_shapes
: 
?
mean_1/total
VariableV2*
_class
loc:@mean_1/total*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name 
?
mean_1/total/AssignAssignmean_1/totalmean_1/total/Initializer/zeros*
use_locking(*
T0*
_class
loc:@mean_1/total*
validate_shape(*
_output_shapes
: 
m
mean_1/total/readIdentitymean_1/total*
T0*
_class
loc:@mean_1/total*
_output_shapes
: 
?
mean_1/count/Initializer/zerosConst*
dtype0*
_output_shapes
: *
valueB
 *    *
_class
loc:@mean_1/count
?
mean_1/count
VariableV2*
shared_name *
_class
loc:@mean_1/count*
	container *
shape: *
dtype0*
_output_shapes
: 
?
mean_1/count/AssignAssignmean_1/countmean_1/count/Initializer/zeros*
use_locking(*
T0*
_class
loc:@mean_1/count*
validate_shape(*
_output_shapes
: 
m
mean_1/count/readIdentitymean_1/count*
_output_shapes
: *
T0*
_class
loc:@mean_1/count
Q
mean_1/ConstConst*
valueB
 *  ??*
dtype0*
_output_shapes
: 
~
;mean_1/broadcast_weights/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 
|
:mean_1/broadcast_weights/assert_broadcastable/weights/rankConst*
value	B : *
dtype0*
_output_shapes
: 
?
:mean_1/broadcast_weights/assert_broadcastable/values/shapeShapeIteratorGetNext:9*
T0*
out_type0*
_output_shapes
:
{
9mean_1/broadcast_weights/assert_broadcastable/values/rankConst*
value	B :*
dtype0*
_output_shapes
: 
Q
Imean_1/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOp
?
(mean_1/broadcast_weights/ones_like/ShapeShapeIteratorGetNext:9J^mean_1/broadcast_weights/assert_broadcastable/static_scalar_check_success*
_output_shapes
:*
T0*
out_type0
?
(mean_1/broadcast_weights/ones_like/ConstConstJ^mean_1/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
"mean_1/broadcast_weights/ones_likeFill(mean_1/broadcast_weights/ones_like/Shape(mean_1/broadcast_weights/ones_like/Const*
T0*

index_type0*#
_output_shapes
:?????????

mean_1/broadcast_weightsMulmean_1/Const"mean_1/broadcast_weights/ones_like*
T0*#
_output_shapes
:?????????
l

mean_1/MulMulIteratorGetNext:9mean_1/broadcast_weights*
T0*#
_output_shapes
:?????????
X
mean_1/Const_1Const*
dtype0*
_output_shapes
:*
valueB: 
y

mean_1/SumSummean_1/broadcast_weightsmean_1/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
X
mean_1/Const_2Const*
dtype0*
_output_shapes
:*
valueB: 
m
mean_1/Sum_1Sum
mean_1/Mulmean_1/Const_2*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
?
mean_1/AssignAdd	AssignAddmean_1/totalmean_1/Sum_1*
use_locking( *
T0*
_class
loc:@mean_1/total*
_output_shapes
: 
?
mean_1/AssignAdd_1	AssignAddmean_1/count
mean_1/Sum^mean_1/Mul*
use_locking( *
T0*
_class
loc:@mean_1/count*
_output_shapes
: 
U
mean_1/Maximum/yConst*
valueB
 *    *
dtype0*
_output_shapes
: 
_
mean_1/MaximumMaximummean_1/count/readmean_1/Maximum/y*
T0*
_output_shapes
: 
\
mean_1/valueDivNoNanmean_1/total/readmean_1/Maximum*
T0*
_output_shapes
: 
W
mean_1/Maximum_1/yConst*
valueB
 *    *
dtype0*
_output_shapes
: 
d
mean_1/Maximum_1Maximummean_1/AssignAdd_1mean_1/Maximum_1/y*
_output_shapes
: *
T0
a
mean_1/update_opDivNoNanmean_1/AssignAddmean_1/Maximum_1*
T0*
_output_shapes
: 
?
mean_2/total/Initializer/zerosConst*
valueB
 *    *
_class
loc:@mean_2/total*
dtype0*
_output_shapes
: 
?
mean_2/total
VariableV2*
dtype0*
_output_shapes
: *
shared_name *
_class
loc:@mean_2/total*
	container *
shape: 
?
mean_2/total/AssignAssignmean_2/totalmean_2/total/Initializer/zeros*
use_locking(*
T0*
_class
loc:@mean_2/total*
validate_shape(*
_output_shapes
: 
m
mean_2/total/readIdentitymean_2/total*
T0*
_class
loc:@mean_2/total*
_output_shapes
: 
?
mean_2/count/Initializer/zerosConst*
valueB
 *    *
_class
loc:@mean_2/count*
dtype0*
_output_shapes
: 
?
mean_2/count
VariableV2*
_class
loc:@mean_2/count*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name 
?
mean_2/count/AssignAssignmean_2/countmean_2/count/Initializer/zeros*
use_locking(*
T0*
_class
loc:@mean_2/count*
validate_shape(*
_output_shapes
: 
m
mean_2/count/readIdentitymean_2/count*
_output_shapes
: *
T0*
_class
loc:@mean_2/count
M
mean_2/SizeConst*
value	B :*
dtype0*
_output_shapes
: 
c
mean_2/ToFloatCastmean_2/Size*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
O
mean_2/ConstConst*
valueB *
dtype0*
_output_shapes
: 
u

mean_2/SumSumhead/weighted_loss/Summean_2/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
?
mean_2/AssignAdd	AssignAddmean_2/total
mean_2/Sum*
T0*
_class
loc:@mean_2/total*
_output_shapes
: *
use_locking( 
?
mean_2/AssignAdd_1	AssignAddmean_2/countmean_2/ToFloat^head/weighted_loss/Sum*
use_locking( *
T0*
_class
loc:@mean_2/count*
_output_shapes
: 
U
mean_2/Maximum/yConst*
valueB
 *    *
dtype0*
_output_shapes
: 
_
mean_2/MaximumMaximummean_2/count/readmean_2/Maximum/y*
T0*
_output_shapes
: 
\
mean_2/valueDivNoNanmean_2/total/readmean_2/Maximum*
T0*
_output_shapes
: 
W
mean_2/Maximum_1/yConst*
valueB
 *    *
dtype0*
_output_shapes
: 
d
mean_2/Maximum_1Maximummean_2/AssignAdd_1mean_2/Maximum_1/y*
T0*
_output_shapes
: 
a
mean_2/update_opDivNoNanmean_2/AssignAddmean_2/Maximum_1*
_output_shapes
: *
T0
e

group_depsNoOp^mean/update_op^mean_1/update_op^mean_2/update_op^prediction/mean/update_op
{
eval_step/Initializer/zerosConst*
value	B	 R *
_class
loc:@eval_step*
dtype0	*
_output_shapes
: 
?
	eval_step
VariableV2*
shared_name *
_class
loc:@eval_step*
	container *
shape: *
dtype0	*
_output_shapes
: 
?
eval_step/AssignAssign	eval_stepeval_step/Initializer/zeros*
use_locking(*
T0	*
_class
loc:@eval_step*
validate_shape(*
_output_shapes
: 
d
eval_step/readIdentity	eval_step*
T0	*
_class
loc:@eval_step*
_output_shapes
: 
Q
AssignAdd/valueConst*
dtype0	*
_output_shapes
: *
value	B	 R
?
	AssignAdd	AssignAdd	eval_stepAssignAdd/value*
use_locking(*
T0	*
_class
loc:@eval_step*
_output_shapes
: 
U
readIdentity	eval_step
^AssignAdd^group_deps*
T0	*
_output_shapes
: 
;
IdentityIdentityread*
_output_shapes
: *
T0	
?
initNoOp1^dnn/hiddenlayer_0/batchnorm_0/beta/part_0/Assign2^dnn/hiddenlayer_0/batchnorm_0/gamma/part_0/Assign1^dnn/hiddenlayer_0/batchnorm_0/moving_mean/Assign5^dnn/hiddenlayer_0/batchnorm_0/moving_variance/Assign%^dnn/hiddenlayer_0/bias/part_0/Assign'^dnn/hiddenlayer_0/kernel/part_0/Assign1^dnn/hiddenlayer_1/batchnorm_1/beta/part_0/Assign2^dnn/hiddenlayer_1/batchnorm_1/gamma/part_0/Assign1^dnn/hiddenlayer_1/batchnorm_1/moving_mean/Assign5^dnn/hiddenlayer_1/batchnorm_1/moving_variance/Assign%^dnn/hiddenlayer_1/bias/part_0/Assign'^dnn/hiddenlayer_1/kernel/part_0/Assign1^dnn/hiddenlayer_2/batchnorm_2/beta/part_0/Assign2^dnn/hiddenlayer_2/batchnorm_2/gamma/part_0/Assign1^dnn/hiddenlayer_2/batchnorm_2/moving_mean/Assign5^dnn/hiddenlayer_2/batchnorm_2/moving_variance/Assign%^dnn/hiddenlayer_2/bias/part_0/Assign'^dnn/hiddenlayer_2/kernel/part_0/Assigna^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Assignc^dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Assign]^dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Assignd^dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Assigna^dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Assign^dnn/logits/bias/part_0/Assign ^dnn/logits/kernel/part_0/Assign^global_step/Assign

init_1NoOp
$
group_deps_1NoOp^init^init_1
?
4report_uninitialized_variables/IsVariableInitializedIsVariableInitializedglobal_step*
_class
loc:@global_step*
dtype0	*
_output_shapes
: 
?
6report_uninitialized_variables/IsVariableInitialized_1IsVariableInitializedYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: *l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0
?
6report_uninitialized_variables/IsVariableInitialized_2IsVariableInitialized[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: *n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0
?
6report_uninitialized_variables/IsVariableInitialized_3IsVariableInitializedUdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
6report_uninitialized_variables/IsVariableInitialized_4IsVariableInitialized\dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: *o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0
?
6report_uninitialized_variables/IsVariableInitialized_5IsVariableInitializedYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
1report_uninitialized_variables/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_0/kernel/part_0*
_output_shapes
: 
?
3report_uninitialized_variables/VarIsInitializedOp_1VarIsInitializedOpdnn/hiddenlayer_0/bias/part_0*
_output_shapes
: 
?
3report_uninitialized_variables/VarIsInitializedOp_2VarIsInitializedOp*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*
_output_shapes
: 
?
3report_uninitialized_variables/VarIsInitializedOp_3VarIsInitializedOp)dnn/hiddenlayer_0/batchnorm_0/beta/part_0*
_output_shapes
: 
?
3report_uninitialized_variables/VarIsInitializedOp_4VarIsInitializedOp)dnn/hiddenlayer_0/batchnorm_0/moving_mean*
_output_shapes
: 
?
3report_uninitialized_variables/VarIsInitializedOp_5VarIsInitializedOp-dnn/hiddenlayer_0/batchnorm_0/moving_variance*
_output_shapes
: 
?
3report_uninitialized_variables/VarIsInitializedOp_6VarIsInitializedOpdnn/hiddenlayer_1/kernel/part_0*
_output_shapes
: 
?
3report_uninitialized_variables/VarIsInitializedOp_7VarIsInitializedOpdnn/hiddenlayer_1/bias/part_0*
_output_shapes
: 
?
3report_uninitialized_variables/VarIsInitializedOp_8VarIsInitializedOp*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*
_output_shapes
: 
?
3report_uninitialized_variables/VarIsInitializedOp_9VarIsInitializedOp)dnn/hiddenlayer_1/batchnorm_1/beta/part_0*
_output_shapes
: 
?
4report_uninitialized_variables/VarIsInitializedOp_10VarIsInitializedOp)dnn/hiddenlayer_1/batchnorm_1/moving_mean*
_output_shapes
: 
?
4report_uninitialized_variables/VarIsInitializedOp_11VarIsInitializedOp-dnn/hiddenlayer_1/batchnorm_1/moving_variance*
_output_shapes
: 
?
4report_uninitialized_variables/VarIsInitializedOp_12VarIsInitializedOpdnn/hiddenlayer_2/kernel/part_0*
_output_shapes
: 
?
4report_uninitialized_variables/VarIsInitializedOp_13VarIsInitializedOpdnn/hiddenlayer_2/bias/part_0*
_output_shapes
: 
?
4report_uninitialized_variables/VarIsInitializedOp_14VarIsInitializedOp*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0*
_output_shapes
: 
?
4report_uninitialized_variables/VarIsInitializedOp_15VarIsInitializedOp)dnn/hiddenlayer_2/batchnorm_2/beta/part_0*
_output_shapes
: 
?
4report_uninitialized_variables/VarIsInitializedOp_16VarIsInitializedOp)dnn/hiddenlayer_2/batchnorm_2/moving_mean*
_output_shapes
: 
?
4report_uninitialized_variables/VarIsInitializedOp_17VarIsInitializedOp-dnn/hiddenlayer_2/batchnorm_2/moving_variance*
_output_shapes
: 
|
4report_uninitialized_variables/VarIsInitializedOp_18VarIsInitializedOpdnn/logits/kernel/part_0*
_output_shapes
: 
z
4report_uninitialized_variables/VarIsInitializedOp_19VarIsInitializedOpdnn/logits/bias/part_0*
_output_shapes
: 
?
6report_uninitialized_variables/IsVariableInitialized_6IsVariableInitialized
mean/total*
_class
loc:@mean/total*
dtype0*
_output_shapes
: 
?
6report_uninitialized_variables/IsVariableInitialized_7IsVariableInitialized
mean/count*
_class
loc:@mean/count*
dtype0*
_output_shapes
: 
?
6report_uninitialized_variables/IsVariableInitialized_8IsVariableInitializedprediction/mean/total*(
_class
loc:@prediction/mean/total*
dtype0*
_output_shapes
: 
?
6report_uninitialized_variables/IsVariableInitialized_9IsVariableInitializedprediction/mean/count*
dtype0*
_output_shapes
: *(
_class
loc:@prediction/mean/count
?
7report_uninitialized_variables/IsVariableInitialized_10IsVariableInitializedmean_1/total*
_class
loc:@mean_1/total*
dtype0*
_output_shapes
: 
?
7report_uninitialized_variables/IsVariableInitialized_11IsVariableInitializedmean_1/count*
_class
loc:@mean_1/count*
dtype0*
_output_shapes
: 
?
7report_uninitialized_variables/IsVariableInitialized_12IsVariableInitializedmean_2/total*
_class
loc:@mean_2/total*
dtype0*
_output_shapes
: 
?
7report_uninitialized_variables/IsVariableInitialized_13IsVariableInitializedmean_2/count*
_class
loc:@mean_2/count*
dtype0*
_output_shapes
: 
?
7report_uninitialized_variables/IsVariableInitialized_14IsVariableInitialized	eval_step*
_class
loc:@eval_step*
dtype0	*
_output_shapes
: 
?
$report_uninitialized_variables/stackPack4report_uninitialized_variables/IsVariableInitialized6report_uninitialized_variables/IsVariableInitialized_16report_uninitialized_variables/IsVariableInitialized_26report_uninitialized_variables/IsVariableInitialized_36report_uninitialized_variables/IsVariableInitialized_46report_uninitialized_variables/IsVariableInitialized_51report_uninitialized_variables/VarIsInitializedOp3report_uninitialized_variables/VarIsInitializedOp_13report_uninitialized_variables/VarIsInitializedOp_23report_uninitialized_variables/VarIsInitializedOp_33report_uninitialized_variables/VarIsInitializedOp_43report_uninitialized_variables/VarIsInitializedOp_53report_uninitialized_variables/VarIsInitializedOp_63report_uninitialized_variables/VarIsInitializedOp_73report_uninitialized_variables/VarIsInitializedOp_83report_uninitialized_variables/VarIsInitializedOp_94report_uninitialized_variables/VarIsInitializedOp_104report_uninitialized_variables/VarIsInitializedOp_114report_uninitialized_variables/VarIsInitializedOp_124report_uninitialized_variables/VarIsInitializedOp_134report_uninitialized_variables/VarIsInitializedOp_144report_uninitialized_variables/VarIsInitializedOp_154report_uninitialized_variables/VarIsInitializedOp_164report_uninitialized_variables/VarIsInitializedOp_174report_uninitialized_variables/VarIsInitializedOp_184report_uninitialized_variables/VarIsInitializedOp_196report_uninitialized_variables/IsVariableInitialized_66report_uninitialized_variables/IsVariableInitialized_76report_uninitialized_variables/IsVariableInitialized_86report_uninitialized_variables/IsVariableInitialized_97report_uninitialized_variables/IsVariableInitialized_107report_uninitialized_variables/IsVariableInitialized_117report_uninitialized_variables/IsVariableInitialized_127report_uninitialized_variables/IsVariableInitialized_137report_uninitialized_variables/IsVariableInitialized_14"/device:CPU:0*
T0
*

axis *
N#*
_output_shapes
:#
?
)report_uninitialized_variables/LogicalNot
LogicalNot$report_uninitialized_variables/stack"/device:CPU:0*
_output_shapes
:#
?
$report_uninitialized_variables/ConstConst"/device:CPU:0*
dtype0*
_output_shapes
:#*?

value?
B?
#Bglobal_stepBYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0B[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0BUdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0B\dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0BYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0Bdnn/hiddenlayer_0/kernel/part_0Bdnn/hiddenlayer_0/bias/part_0B*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0B)dnn/hiddenlayer_0/batchnorm_0/beta/part_0B)dnn/hiddenlayer_0/batchnorm_0/moving_meanB-dnn/hiddenlayer_0/batchnorm_0/moving_varianceBdnn/hiddenlayer_1/kernel/part_0Bdnn/hiddenlayer_1/bias/part_0B*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0B)dnn/hiddenlayer_1/batchnorm_1/beta/part_0B)dnn/hiddenlayer_1/batchnorm_1/moving_meanB-dnn/hiddenlayer_1/batchnorm_1/moving_varianceBdnn/hiddenlayer_2/kernel/part_0Bdnn/hiddenlayer_2/bias/part_0B*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0B)dnn/hiddenlayer_2/batchnorm_2/beta/part_0B)dnn/hiddenlayer_2/batchnorm_2/moving_meanB-dnn/hiddenlayer_2/batchnorm_2/moving_varianceBdnn/logits/kernel/part_0Bdnn/logits/bias/part_0B
mean/totalB
mean/countBprediction/mean/totalBprediction/mean/countBmean_1/totalBmean_1/countBmean_2/totalBmean_2/countB	eval_step
?
1report_uninitialized_variables/boolean_mask/ShapeConst"/device:CPU:0*
valueB:#*
dtype0*
_output_shapes
:
?
?report_uninitialized_variables/boolean_mask/strided_slice/stackConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB: 
?
Areport_uninitialized_variables/boolean_mask/strided_slice/stack_1Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
?
Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
?
9report_uninitialized_variables/boolean_mask/strided_sliceStridedSlice1report_uninitialized_variables/boolean_mask/Shape?report_uninitialized_variables/boolean_mask/strided_slice/stackAreport_uninitialized_variables/boolean_mask/strided_slice/stack_1Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2"/device:CPU:0*
shrink_axis_mask *
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
:*
T0*
Index0
?
Breport_uninitialized_variables/boolean_mask/Prod/reduction_indicesConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:
?
0report_uninitialized_variables/boolean_mask/ProdProd9report_uninitialized_variables/boolean_mask/strided_sliceBreport_uninitialized_variables/boolean_mask/Prod/reduction_indices"/device:CPU:0*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
?
3report_uninitialized_variables/boolean_mask/Shape_1Const"/device:CPU:0*
valueB:#*
dtype0*
_output_shapes
:
?
Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:
?
Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Const"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:
?
Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2Const"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:
?
;report_uninitialized_variables/boolean_mask/strided_slice_1StridedSlice3report_uninitialized_variables/boolean_mask/Shape_1Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackCreport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2"/device:CPU:0*
Index0*
T0*
shrink_axis_mask *
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask *
_output_shapes
: 
?
3report_uninitialized_variables/boolean_mask/Shape_2Const"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:#
?
Areport_uninitialized_variables/boolean_mask/strided_slice_2/stackConst"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
?
Creport_uninitialized_variables/boolean_mask/strided_slice_2/stack_1Const"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:
?
Creport_uninitialized_variables/boolean_mask/strided_slice_2/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
?
;report_uninitialized_variables/boolean_mask/strided_slice_2StridedSlice3report_uninitialized_variables/boolean_mask/Shape_2Areport_uninitialized_variables/boolean_mask/strided_slice_2/stackCreport_uninitialized_variables/boolean_mask/strided_slice_2/stack_1Creport_uninitialized_variables/boolean_mask/strided_slice_2/stack_2"/device:CPU:0*
shrink_axis_mask *
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask*
_output_shapes
: *
Index0*
T0
?
;report_uninitialized_variables/boolean_mask/concat/values_1Pack0report_uninitialized_variables/boolean_mask/Prod"/device:CPU:0*
T0*

axis *
N*
_output_shapes
:
?
7report_uninitialized_variables/boolean_mask/concat/axisConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
?
2report_uninitialized_variables/boolean_mask/concatConcatV2;report_uninitialized_variables/boolean_mask/strided_slice_1;report_uninitialized_variables/boolean_mask/concat/values_1;report_uninitialized_variables/boolean_mask/strided_slice_27report_uninitialized_variables/boolean_mask/concat/axis"/device:CPU:0*
T0*
N*
_output_shapes
:*

Tidx0
?
3report_uninitialized_variables/boolean_mask/ReshapeReshape$report_uninitialized_variables/Const2report_uninitialized_variables/boolean_mask/concat"/device:CPU:0*
T0*
Tshape0*
_output_shapes
:#
?
;report_uninitialized_variables/boolean_mask/Reshape_1/shapeConst"/device:CPU:0*
valueB:
?????????*
dtype0*
_output_shapes
:
?
5report_uninitialized_variables/boolean_mask/Reshape_1Reshape)report_uninitialized_variables/LogicalNot;report_uninitialized_variables/boolean_mask/Reshape_1/shape"/device:CPU:0*
T0
*
Tshape0*
_output_shapes
:#
?
1report_uninitialized_variables/boolean_mask/WhereWhere5report_uninitialized_variables/boolean_mask/Reshape_1"/device:CPU:0*
T0
*'
_output_shapes
:?????????
?
3report_uninitialized_variables/boolean_mask/SqueezeSqueeze1report_uninitialized_variables/boolean_mask/Where"/device:CPU:0*
T0	*#
_output_shapes
:?????????*
squeeze_dims

?
9report_uninitialized_variables/boolean_mask/GatherV2/axisConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
?
4report_uninitialized_variables/boolean_mask/GatherV2GatherV23report_uninitialized_variables/boolean_mask/Reshape3report_uninitialized_variables/boolean_mask/Squeeze9report_uninitialized_variables/boolean_mask/GatherV2/axis"/device:CPU:0*
Tindices0	*
Tparams0*#
_output_shapes
:?????????*
Taxis0
v
$report_uninitialized_resources/ConstConst"/device:CPU:0*
valueB *
dtype0*
_output_shapes
: 
M
concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
?
concatConcatV24report_uninitialized_variables/boolean_mask/GatherV2$report_uninitialized_resources/Constconcat/axis*
T0*
N*#
_output_shapes
:?????????*

Tidx0
?
6report_uninitialized_variables_1/IsVariableInitializedIsVariableInitializedglobal_step*
_class
loc:@global_step*
dtype0	*
_output_shapes
: 
?
8report_uninitialized_variables_1/IsVariableInitialized_1IsVariableInitializedYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
8report_uninitialized_variables_1/IsVariableInitialized_2IsVariableInitialized[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
8report_uninitialized_variables_1/IsVariableInitialized_3IsVariableInitializedUdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
8report_uninitialized_variables_1/IsVariableInitialized_4IsVariableInitialized\dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
8report_uninitialized_variables_1/IsVariableInitialized_5IsVariableInitializedYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
3report_uninitialized_variables_1/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_0/kernel/part_0*
_output_shapes
: 
?
5report_uninitialized_variables_1/VarIsInitializedOp_1VarIsInitializedOpdnn/hiddenlayer_0/bias/part_0*
_output_shapes
: 
?
5report_uninitialized_variables_1/VarIsInitializedOp_2VarIsInitializedOp*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*
_output_shapes
: 
?
5report_uninitialized_variables_1/VarIsInitializedOp_3VarIsInitializedOp)dnn/hiddenlayer_0/batchnorm_0/beta/part_0*
_output_shapes
: 
?
5report_uninitialized_variables_1/VarIsInitializedOp_4VarIsInitializedOp)dnn/hiddenlayer_0/batchnorm_0/moving_mean*
_output_shapes
: 
?
5report_uninitialized_variables_1/VarIsInitializedOp_5VarIsInitializedOp-dnn/hiddenlayer_0/batchnorm_0/moving_variance*
_output_shapes
: 
?
5report_uninitialized_variables_1/VarIsInitializedOp_6VarIsInitializedOpdnn/hiddenlayer_1/kernel/part_0*
_output_shapes
: 
?
5report_uninitialized_variables_1/VarIsInitializedOp_7VarIsInitializedOpdnn/hiddenlayer_1/bias/part_0*
_output_shapes
: 
?
5report_uninitialized_variables_1/VarIsInitializedOp_8VarIsInitializedOp*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*
_output_shapes
: 
?
5report_uninitialized_variables_1/VarIsInitializedOp_9VarIsInitializedOp)dnn/hiddenlayer_1/batchnorm_1/beta/part_0*
_output_shapes
: 
?
6report_uninitialized_variables_1/VarIsInitializedOp_10VarIsInitializedOp)dnn/hiddenlayer_1/batchnorm_1/moving_mean*
_output_shapes
: 
?
6report_uninitialized_variables_1/VarIsInitializedOp_11VarIsInitializedOp-dnn/hiddenlayer_1/batchnorm_1/moving_variance*
_output_shapes
: 
?
6report_uninitialized_variables_1/VarIsInitializedOp_12VarIsInitializedOpdnn/hiddenlayer_2/kernel/part_0*
_output_shapes
: 
?
6report_uninitialized_variables_1/VarIsInitializedOp_13VarIsInitializedOpdnn/hiddenlayer_2/bias/part_0*
_output_shapes
: 
?
6report_uninitialized_variables_1/VarIsInitializedOp_14VarIsInitializedOp*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0*
_output_shapes
: 
?
6report_uninitialized_variables_1/VarIsInitializedOp_15VarIsInitializedOp)dnn/hiddenlayer_2/batchnorm_2/beta/part_0*
_output_shapes
: 
?
6report_uninitialized_variables_1/VarIsInitializedOp_16VarIsInitializedOp)dnn/hiddenlayer_2/batchnorm_2/moving_mean*
_output_shapes
: 
?
6report_uninitialized_variables_1/VarIsInitializedOp_17VarIsInitializedOp-dnn/hiddenlayer_2/batchnorm_2/moving_variance*
_output_shapes
: 
~
6report_uninitialized_variables_1/VarIsInitializedOp_18VarIsInitializedOpdnn/logits/kernel/part_0*
_output_shapes
: 
|
6report_uninitialized_variables_1/VarIsInitializedOp_19VarIsInitializedOpdnn/logits/bias/part_0*
_output_shapes
: 
?
&report_uninitialized_variables_1/stackPack6report_uninitialized_variables_1/IsVariableInitialized8report_uninitialized_variables_1/IsVariableInitialized_18report_uninitialized_variables_1/IsVariableInitialized_28report_uninitialized_variables_1/IsVariableInitialized_38report_uninitialized_variables_1/IsVariableInitialized_48report_uninitialized_variables_1/IsVariableInitialized_53report_uninitialized_variables_1/VarIsInitializedOp5report_uninitialized_variables_1/VarIsInitializedOp_15report_uninitialized_variables_1/VarIsInitializedOp_25report_uninitialized_variables_1/VarIsInitializedOp_35report_uninitialized_variables_1/VarIsInitializedOp_45report_uninitialized_variables_1/VarIsInitializedOp_55report_uninitialized_variables_1/VarIsInitializedOp_65report_uninitialized_variables_1/VarIsInitializedOp_75report_uninitialized_variables_1/VarIsInitializedOp_85report_uninitialized_variables_1/VarIsInitializedOp_96report_uninitialized_variables_1/VarIsInitializedOp_106report_uninitialized_variables_1/VarIsInitializedOp_116report_uninitialized_variables_1/VarIsInitializedOp_126report_uninitialized_variables_1/VarIsInitializedOp_136report_uninitialized_variables_1/VarIsInitializedOp_146report_uninitialized_variables_1/VarIsInitializedOp_156report_uninitialized_variables_1/VarIsInitializedOp_166report_uninitialized_variables_1/VarIsInitializedOp_176report_uninitialized_variables_1/VarIsInitializedOp_186report_uninitialized_variables_1/VarIsInitializedOp_19"/device:CPU:0*
T0
*

axis *
N*
_output_shapes
:
?
+report_uninitialized_variables_1/LogicalNot
LogicalNot&report_uninitialized_variables_1/stack"/device:CPU:0*
_output_shapes
:
?

&report_uninitialized_variables_1/ConstConst"/device:CPU:0*?	
value?	B?	Bglobal_stepBYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0B[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0BUdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0B\dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0BYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0Bdnn/hiddenlayer_0/kernel/part_0Bdnn/hiddenlayer_0/bias/part_0B*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0B)dnn/hiddenlayer_0/batchnorm_0/beta/part_0B)dnn/hiddenlayer_0/batchnorm_0/moving_meanB-dnn/hiddenlayer_0/batchnorm_0/moving_varianceBdnn/hiddenlayer_1/kernel/part_0Bdnn/hiddenlayer_1/bias/part_0B*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0B)dnn/hiddenlayer_1/batchnorm_1/beta/part_0B)dnn/hiddenlayer_1/batchnorm_1/moving_meanB-dnn/hiddenlayer_1/batchnorm_1/moving_varianceBdnn/hiddenlayer_2/kernel/part_0Bdnn/hiddenlayer_2/bias/part_0B*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0B)dnn/hiddenlayer_2/batchnorm_2/beta/part_0B)dnn/hiddenlayer_2/batchnorm_2/moving_meanB-dnn/hiddenlayer_2/batchnorm_2/moving_varianceBdnn/logits/kernel/part_0Bdnn/logits/bias/part_0*
dtype0*
_output_shapes
:
?
3report_uninitialized_variables_1/boolean_mask/ShapeConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:
?
Areport_uninitialized_variables_1/boolean_mask/strided_slice/stackConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB: 
?
Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
?
Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
?
;report_uninitialized_variables_1/boolean_mask/strided_sliceStridedSlice3report_uninitialized_variables_1/boolean_mask/ShapeAreport_uninitialized_variables_1/boolean_mask/strided_slice/stackCreport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2"/device:CPU:0*
end_mask *
_output_shapes
:*
T0*
Index0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask 
?
Dreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indicesConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:
?
2report_uninitialized_variables_1/boolean_mask/ProdProd;report_uninitialized_variables_1/boolean_mask/strided_sliceDreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indices"/device:CPU:0*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
?
5report_uninitialized_variables_1/boolean_mask/Shape_1Const"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:
?
Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:
?
Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Const"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:
?
Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
?
=report_uninitialized_variables_1/boolean_mask/strided_slice_1StridedSlice5report_uninitialized_variables_1/boolean_mask/Shape_1Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackEreport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2"/device:CPU:0*
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask 
?
5report_uninitialized_variables_1/boolean_mask/Shape_2Const"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:
?
Creport_uninitialized_variables_1/boolean_mask/strided_slice_2/stackConst"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
?
Ereport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_1Const"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:
?
Ereport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
?
=report_uninitialized_variables_1/boolean_mask/strided_slice_2StridedSlice5report_uninitialized_variables_1/boolean_mask/Shape_2Creport_uninitialized_variables_1/boolean_mask/strided_slice_2/stackEreport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_1Ereport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_2"/device:CPU:0*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask*
_output_shapes
: *
Index0*
T0*
shrink_axis_mask 
?
=report_uninitialized_variables_1/boolean_mask/concat/values_1Pack2report_uninitialized_variables_1/boolean_mask/Prod"/device:CPU:0*
T0*

axis *
N*
_output_shapes
:
?
9report_uninitialized_variables_1/boolean_mask/concat/axisConst"/device:CPU:0*
dtype0*
_output_shapes
: *
value	B : 
?
4report_uninitialized_variables_1/boolean_mask/concatConcatV2=report_uninitialized_variables_1/boolean_mask/strided_slice_1=report_uninitialized_variables_1/boolean_mask/concat/values_1=report_uninitialized_variables_1/boolean_mask/strided_slice_29report_uninitialized_variables_1/boolean_mask/concat/axis"/device:CPU:0*
T0*
N*
_output_shapes
:*

Tidx0
?
5report_uninitialized_variables_1/boolean_mask/ReshapeReshape&report_uninitialized_variables_1/Const4report_uninitialized_variables_1/boolean_mask/concat"/device:CPU:0*
_output_shapes
:*
T0*
Tshape0
?
=report_uninitialized_variables_1/boolean_mask/Reshape_1/shapeConst"/device:CPU:0*
valueB:
?????????*
dtype0*
_output_shapes
:
?
7report_uninitialized_variables_1/boolean_mask/Reshape_1Reshape+report_uninitialized_variables_1/LogicalNot=report_uninitialized_variables_1/boolean_mask/Reshape_1/shape"/device:CPU:0*
T0
*
Tshape0*
_output_shapes
:
?
3report_uninitialized_variables_1/boolean_mask/WhereWhere7report_uninitialized_variables_1/boolean_mask/Reshape_1"/device:CPU:0*'
_output_shapes
:?????????*
T0

?
5report_uninitialized_variables_1/boolean_mask/SqueezeSqueeze3report_uninitialized_variables_1/boolean_mask/Where"/device:CPU:0*
squeeze_dims
*
T0	*#
_output_shapes
:?????????
?
;report_uninitialized_variables_1/boolean_mask/GatherV2/axisConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
?
6report_uninitialized_variables_1/boolean_mask/GatherV2GatherV25report_uninitialized_variables_1/boolean_mask/Reshape5report_uninitialized_variables_1/boolean_mask/Squeeze;report_uninitialized_variables_1/boolean_mask/GatherV2/axis"/device:CPU:0*
Taxis0*
Tindices0	*
Tparams0*#
_output_shapes
:?????????
x
&report_uninitialized_resources_1/ConstConst"/device:CPU:0*
valueB *
dtype0*
_output_shapes
: 
O
concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
concat_1ConcatV26report_uninitialized_variables_1/boolean_mask/GatherV2&report_uninitialized_resources_1/Constconcat_1/axis*
N*#
_output_shapes
:?????????*

Tidx0*
T0
?
init_2NoOp^eval_step/Assign^mean/count/Assign^mean/total/Assign^mean_1/count/Assign^mean_1/total/Assign^mean_2/count/Assign^mean_2/total/Assign^prediction/mean/count/Assign^prediction/mean/total/Assign
?
init_all_tablesNoOpj^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/hash_table/table_initn^dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/hash_table/table_initb^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/hash_table/table_initp^dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/hash_table/table_initj^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_table/table_init

init_3NoOp
8
group_deps_2NoOp^init_2^init_3^init_all_tables
?
Merge/MergeSummaryMergeSummarylearning_rate-dnn/dnn/hiddenlayer_0/fraction_of_zero_values dnn/dnn/hiddenlayer_0/activation-dnn/dnn/hiddenlayer_1/fraction_of_zero_values dnn/dnn/hiddenlayer_1/activation-dnn/dnn/hiddenlayer_2/fraction_of_zero_values dnn/dnn/hiddenlayer_2/activation&dnn/dnn/logits/fraction_of_zero_valuesdnn/dnn/logits/activation*
N	*
_output_shapes
: 
Y
save/filename/inputConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
n
save/filenamePlaceholderWithDefaultsave/filename/input*
shape: *
dtype0*
_output_shapes
: 
e

save/ConstPlaceholderWithDefaultsave/filename*
dtype0*
_output_shapes
: *
shape: 
~
save/Read/ReadVariableOpReadVariableOp)dnn/hiddenlayer_0/batchnorm_0/beta/part_0*
dtype0*
_output_shapes
: 
X
save/IdentityIdentitysave/Read/ReadVariableOp*
T0*
_output_shapes
: 
^
save/Identity_1Identitysave/Identity"/device:CPU:0*
T0*
_output_shapes
: 
?
save/Read_1/ReadVariableOpReadVariableOp*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*
dtype0*
_output_shapes
: 
\
save/Identity_2Identitysave/Read_1/ReadVariableOp*
_output_shapes
: *
T0
`
save/Identity_3Identitysave/Identity_2"/device:CPU:0*
_output_shapes
: *
T0
t
save/Read_2/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes
: 
\
save/Identity_4Identitysave/Read_2/ReadVariableOp*
T0*
_output_shapes
: 
`
save/Identity_5Identitysave/Identity_4"/device:CPU:0*
_output_shapes
: *
T0
z
save/Read_3/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes

: 
`
save/Identity_6Identitysave/Read_3/ReadVariableOp*
_output_shapes

: *
T0
d
save/Identity_7Identitysave/Identity_6"/device:CPU:0*
T0*
_output_shapes

: 
?
save/Read_4/ReadVariableOpReadVariableOp)dnn/hiddenlayer_1/batchnorm_1/beta/part_0*
dtype0*
_output_shapes
:
\
save/Identity_8Identitysave/Read_4/ReadVariableOp*
T0*
_output_shapes
:
`
save/Identity_9Identitysave/Identity_8"/device:CPU:0*
T0*
_output_shapes
:
?
save/Read_5/ReadVariableOpReadVariableOp*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*
dtype0*
_output_shapes
:
]
save/Identity_10Identitysave/Read_5/ReadVariableOp*
T0*
_output_shapes
:
b
save/Identity_11Identitysave/Identity_10"/device:CPU:0*
T0*
_output_shapes
:
t
save/Read_6/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0*
dtype0*
_output_shapes
:
]
save/Identity_12Identitysave/Read_6/ReadVariableOp*
T0*
_output_shapes
:
b
save/Identity_13Identitysave/Identity_12"/device:CPU:0*
T0*
_output_shapes
:
z
save/Read_7/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes

: 
a
save/Identity_14Identitysave/Read_7/ReadVariableOp*
T0*
_output_shapes

: 
f
save/Identity_15Identitysave/Identity_14"/device:CPU:0*
T0*
_output_shapes

: 
?
save/Read_8/ReadVariableOpReadVariableOp)dnn/hiddenlayer_2/batchnorm_2/beta/part_0*
dtype0*
_output_shapes
:
]
save/Identity_16Identitysave/Read_8/ReadVariableOp*
T0*
_output_shapes
:
b
save/Identity_17Identitysave/Identity_16"/device:CPU:0*
_output_shapes
:*
T0
?
save/Read_9/ReadVariableOpReadVariableOp*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0*
dtype0*
_output_shapes
:
]
save/Identity_18Identitysave/Read_9/ReadVariableOp*
T0*
_output_shapes
:
b
save/Identity_19Identitysave/Identity_18"/device:CPU:0*
T0*
_output_shapes
:
u
save/Read_10/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0*
dtype0*
_output_shapes
:
^
save/Identity_20Identitysave/Read_10/ReadVariableOp*
T0*
_output_shapes
:
b
save/Identity_21Identitysave/Identity_20"/device:CPU:0*
T0*
_output_shapes
:
{
save/Read_11/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes

:
b
save/Identity_22Identitysave/Read_11/ReadVariableOp*
T0*
_output_shapes

:
f
save/Identity_23Identitysave/Identity_22"/device:CPU:0*
T0*
_output_shapes

:
n
save/Read_12/ReadVariableOpReadVariableOpdnn/logits/bias/part_0*
dtype0*
_output_shapes
:
^
save/Identity_24Identitysave/Read_12/ReadVariableOp*
T0*
_output_shapes
:
b
save/Identity_25Identitysave/Identity_24"/device:CPU:0*
T0*
_output_shapes
:
t
save/Read_13/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0*
dtype0*
_output_shapes

:
b
save/Identity_26Identitysave/Read_13/ReadVariableOp*
T0*
_output_shapes

:
f
save/Identity_27Identitysave/Identity_26"/device:CPU:0*
T0*
_output_shapes

:
?
save/StringJoin/inputs_1Const*<
value3B1 B+_temp_681207dc7fd241d7affd68d46faf7ea3/part*
dtype0*
_output_shapes
: 
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
Q
save/num_shardsConst*
dtype0*
_output_shapes
: *
value	B :
k
save/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
?
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
?
save/SaveV2/tensor_namesConst"/device:CPU:0*?
value?B?B)dnn/hiddenlayer_0/batchnorm_0/moving_meanB-dnn/hiddenlayer_0/batchnorm_0/moving_varianceB)dnn/hiddenlayer_1/batchnorm_1/moving_meanB-dnn/hiddenlayer_1/batchnorm_1/moving_varianceB)dnn/hiddenlayer_2/batchnorm_2/moving_meanB-dnn/hiddenlayer_2/batchnorm_2/moving_varianceBRdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weightsBTdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weightsBNdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weightsBUdnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weightsBRdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weightsBglobal_step*
dtype0*
_output_shapes
:
?
save/SaveV2/shape_and_slicesConst"/device:CPU:0*d
value[BYB B B B B B B3 2 0,3:0,2B3 2 0,3:0,2B2 2 0,2:0,2B2 2 0,2:0,2B12 4 0,12:0,4B *
dtype0*
_output_shapes
:
?
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slices=dnn/hiddenlayer_0/batchnorm_0/moving_mean/Read/ReadVariableOpAdnn/hiddenlayer_0/batchnorm_0/moving_variance/Read/ReadVariableOp=dnn/hiddenlayer_1/batchnorm_1/moving_mean/Read/ReadVariableOpAdnn/hiddenlayer_1/batchnorm_1/moving_variance/Read/ReadVariableOp=dnn/hiddenlayer_2/batchnorm_2/moving_mean/Read/ReadVariableOpAdnn/hiddenlayer_2/batchnorm_2/moving_variance/Read/ReadVariableOp^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/read`dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/readZdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/readadnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/read^dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/readglobal_step"/device:CPU:0*
dtypes
2	
?
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
m
save/ShardedFilename_1/shardConst"/device:CPU:0*
value	B :*
dtype0*
_output_shapes
: 
?
save/ShardedFilename_1ShardedFilenamesave/StringJoinsave/ShardedFilename_1/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
?
save/Read_14/ReadVariableOpReadVariableOp)dnn/hiddenlayer_0/batchnorm_0/beta/part_0"/device:CPU:0*
dtype0*
_output_shapes
: 
m
save/Identity_28Identitysave/Read_14/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
: 
b
save/Identity_29Identitysave/Identity_28"/device:CPU:0*
T0*
_output_shapes
: 
?
save/Read_15/ReadVariableOpReadVariableOp*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0"/device:CPU:0*
dtype0*
_output_shapes
: 
m
save/Identity_30Identitysave/Read_15/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
: 
b
save/Identity_31Identitysave/Identity_30"/device:CPU:0*
T0*
_output_shapes
: 
?
save/Read_16/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes
: 
m
save/Identity_32Identitysave/Read_16/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
: 
b
save/Identity_33Identitysave/Identity_32"/device:CPU:0*
T0*
_output_shapes
: 
?
save/Read_17/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0"/device:CPU:0*
dtype0*
_output_shapes

: 
q
save/Identity_34Identitysave/Read_17/ReadVariableOp"/device:CPU:0*
_output_shapes

: *
T0
f
save/Identity_35Identitysave/Identity_34"/device:CPU:0*
_output_shapes

: *
T0
?
save/Read_18/ReadVariableOpReadVariableOp)dnn/hiddenlayer_1/batchnorm_1/beta/part_0"/device:CPU:0*
dtype0*
_output_shapes
:
m
save/Identity_36Identitysave/Read_18/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:
b
save/Identity_37Identitysave/Identity_36"/device:CPU:0*
_output_shapes
:*
T0
?
save/Read_19/ReadVariableOpReadVariableOp*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0"/device:CPU:0*
dtype0*
_output_shapes
:
m
save/Identity_38Identitysave/Read_19/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:
b
save/Identity_39Identitysave/Identity_38"/device:CPU:0*
T0*
_output_shapes
:
?
save/Read_20/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes
:
m
save/Identity_40Identitysave/Read_20/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:
b
save/Identity_41Identitysave/Identity_40"/device:CPU:0*
_output_shapes
:*
T0
?
save/Read_21/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0"/device:CPU:0*
dtype0*
_output_shapes

: 
q
save/Identity_42Identitysave/Read_21/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

: 
f
save/Identity_43Identitysave/Identity_42"/device:CPU:0*
T0*
_output_shapes

: 
?
save/Read_22/ReadVariableOpReadVariableOp)dnn/hiddenlayer_2/batchnorm_2/beta/part_0"/device:CPU:0*
dtype0*
_output_shapes
:
m
save/Identity_44Identitysave/Read_22/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:
b
save/Identity_45Identitysave/Identity_44"/device:CPU:0*
T0*
_output_shapes
:
?
save/Read_23/ReadVariableOpReadVariableOp*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0"/device:CPU:0*
dtype0*
_output_shapes
:
m
save/Identity_46Identitysave/Read_23/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:
b
save/Identity_47Identitysave/Identity_46"/device:CPU:0*
T0*
_output_shapes
:
?
save/Read_24/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes
:
m
save/Identity_48Identitysave/Read_24/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:
b
save/Identity_49Identitysave/Identity_48"/device:CPU:0*
T0*
_output_shapes
:
?
save/Read_25/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0"/device:CPU:0*
dtype0*
_output_shapes

:
q
save/Identity_50Identitysave/Read_25/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:
f
save/Identity_51Identitysave/Identity_50"/device:CPU:0*
T0*
_output_shapes

:
}
save/Read_26/ReadVariableOpReadVariableOpdnn/logits/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes
:
m
save/Identity_52Identitysave/Read_26/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:
b
save/Identity_53Identitysave/Identity_52"/device:CPU:0*
_output_shapes
:*
T0
?
save/Read_27/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0"/device:CPU:0*
dtype0*
_output_shapes

:
q
save/Identity_54Identitysave/Read_27/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:
f
save/Identity_55Identitysave/Identity_54"/device:CPU:0*
T0*
_output_shapes

:
?
save/SaveV2_1/tensor_namesConst"/device:CPU:0*?
value?B?B"dnn/hiddenlayer_0/batchnorm_0/betaB#dnn/hiddenlayer_0/batchnorm_0/gammaBdnn/hiddenlayer_0/biasBdnn/hiddenlayer_0/kernelB"dnn/hiddenlayer_1/batchnorm_1/betaB#dnn/hiddenlayer_1/batchnorm_1/gammaBdnn/hiddenlayer_1/biasBdnn/hiddenlayer_1/kernelB"dnn/hiddenlayer_2/batchnorm_2/betaB#dnn/hiddenlayer_2/batchnorm_2/gammaBdnn/hiddenlayer_2/biasBdnn/hiddenlayer_2/kernelBdnn/logits/biasBdnn/logits/kernel*
dtype0*
_output_shapes
:
?
save/SaveV2_1/shape_and_slicesConst"/device:CPU:0*?
value?B?B32 0,32B32 0,32B32 0,32B15 32 0,15:0,32B22 0,22B22 0,22B22 0,22B32 22 0,32:0,22B15 0,15B15 0,15B15 0,15B22 15 0,22:0,15B1 0,1B15 1 0,15:0,1*
dtype0*
_output_shapes
:
?
save/SaveV2_1SaveV2save/ShardedFilename_1save/SaveV2_1/tensor_namessave/SaveV2_1/shape_and_slicessave/Identity_29save/Identity_31save/Identity_33save/Identity_35save/Identity_37save/Identity_39save/Identity_41save/Identity_43save/Identity_45save/Identity_47save/Identity_49save/Identity_51save/Identity_53save/Identity_55"/device:CPU:0*
dtypes
2
?
save/control_dependency_1Identitysave/ShardedFilename_1^save/SaveV2_1"/device:CPU:0*
T0*)
_class
loc:@save/ShardedFilename_1*
_output_shapes
: 
?
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilenamesave/ShardedFilename_1^save/control_dependency^save/control_dependency_1"/device:CPU:0*
T0*

axis *
N*
_output_shapes
:
?
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0*
delete_old_dirs(
?
save/Identity_56Identity
save/Const^save/MergeV2Checkpoints^save/control_dependency^save/control_dependency_1"/device:CPU:0*
T0*
_output_shapes
: 
?
save/RestoreV2/tensor_namesConst"/device:CPU:0*?
value?B?B)dnn/hiddenlayer_0/batchnorm_0/moving_meanB-dnn/hiddenlayer_0/batchnorm_0/moving_varianceB)dnn/hiddenlayer_1/batchnorm_1/moving_meanB-dnn/hiddenlayer_1/batchnorm_1/moving_varianceB)dnn/hiddenlayer_2/batchnorm_2/moving_meanB-dnn/hiddenlayer_2/batchnorm_2/moving_varianceBRdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weightsBTdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weightsBNdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weightsBUdnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weightsBRdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weightsBglobal_step*
dtype0*
_output_shapes
:
?
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*d
value[BYB B B B B B B3 2 0,3:0,2B3 2 0,3:0,2B2 2 0,2:0,2B2 2 0,2:0,2B12 4 0,12:0,4B *
dtype0*
_output_shapes
:
?
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*
dtypes
2	*b
_output_shapesP
N::::::::::::
O
save/Identity_57Identitysave/RestoreV2*
_output_shapes
:*
T0
s
save/AssignVariableOpAssignVariableOp)dnn/hiddenlayer_0/batchnorm_0/moving_meansave/Identity_57*
dtype0
Q
save/Identity_58Identitysave/RestoreV2:1*
_output_shapes
:*
T0
y
save/AssignVariableOp_1AssignVariableOp-dnn/hiddenlayer_0/batchnorm_0/moving_variancesave/Identity_58*
dtype0
Q
save/Identity_59Identitysave/RestoreV2:2*
T0*
_output_shapes
:
u
save/AssignVariableOp_2AssignVariableOp)dnn/hiddenlayer_1/batchnorm_1/moving_meansave/Identity_59*
dtype0
Q
save/Identity_60Identitysave/RestoreV2:3*
_output_shapes
:*
T0
y
save/AssignVariableOp_3AssignVariableOp-dnn/hiddenlayer_1/batchnorm_1/moving_variancesave/Identity_60*
dtype0
Q
save/Identity_61Identitysave/RestoreV2:4*
_output_shapes
:*
T0
u
save/AssignVariableOp_4AssignVariableOp)dnn/hiddenlayer_2/batchnorm_2/moving_meansave/Identity_61*
dtype0
Q
save/Identity_62Identitysave/RestoreV2:5*
_output_shapes
:*
T0
y
save/AssignVariableOp_5AssignVariableOp-dnn/hiddenlayer_2/batchnorm_2/moving_variancesave/Identity_62*
dtype0
?
save/AssignAssignYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0save/RestoreV2:6*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
validate_shape(*
_output_shapes

:*
use_locking(
?
save/Assign_1Assign[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0save/RestoreV2:7*
T0*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
validate_shape(*
_output_shapes

:*
use_locking(
?
save/Assign_2AssignUdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0save/RestoreV2:8*
use_locking(*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
validate_shape(*
_output_shapes

:
?
save/Assign_3Assign\dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0save/RestoreV2:9*
use_locking(*
T0*o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
validate_shape(*
_output_shapes

:
?
save/Assign_4AssignYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0save/RestoreV2:10*
validate_shape(*
_output_shapes

:*
use_locking(*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0
?
save/Assign_5Assignglobal_stepsave/RestoreV2:11*
validate_shape(*
_output_shapes
: *
use_locking(*
T0	*
_class
loc:@global_step
?
save/restore_shardNoOp^save/Assign^save/AssignVariableOp^save/AssignVariableOp_1^save/AssignVariableOp_2^save/AssignVariableOp_3^save/AssignVariableOp_4^save/AssignVariableOp_5^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5
?
save/RestoreV2_1/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*?
value?B?B"dnn/hiddenlayer_0/batchnorm_0/betaB#dnn/hiddenlayer_0/batchnorm_0/gammaBdnn/hiddenlayer_0/biasBdnn/hiddenlayer_0/kernelB"dnn/hiddenlayer_1/batchnorm_1/betaB#dnn/hiddenlayer_1/batchnorm_1/gammaBdnn/hiddenlayer_1/biasBdnn/hiddenlayer_1/kernelB"dnn/hiddenlayer_2/batchnorm_2/betaB#dnn/hiddenlayer_2/batchnorm_2/gammaBdnn/hiddenlayer_2/biasBdnn/hiddenlayer_2/kernelBdnn/logits/biasBdnn/logits/kernel
?
!save/RestoreV2_1/shape_and_slicesConst"/device:CPU:0*?
value?B?B32 0,32B32 0,32B32 0,32B15 32 0,15:0,32B22 0,22B22 0,22B22 0,22B32 22 0,32:0,22B15 0,15B15 0,15B15 0,15B22 15 0,22:0,15B1 0,1B15 1 0,15:0,1*
dtype0*
_output_shapes
:
?
save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices"/device:CPU:0*x
_output_shapesf
d: : : : :::: ::::::*
dtypes
2
b
save/Identity_63Identitysave/RestoreV2_1"/device:CPU:0*
T0*
_output_shapes
: 
?
save/AssignVariableOp_6AssignVariableOp)dnn/hiddenlayer_0/batchnorm_0/beta/part_0save/Identity_63"/device:CPU:0*
dtype0
d
save/Identity_64Identitysave/RestoreV2_1:1"/device:CPU:0*
_output_shapes
: *
T0
?
save/AssignVariableOp_7AssignVariableOp*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0save/Identity_64"/device:CPU:0*
dtype0
d
save/Identity_65Identitysave/RestoreV2_1:2"/device:CPU:0*
T0*
_output_shapes
: 
x
save/AssignVariableOp_8AssignVariableOpdnn/hiddenlayer_0/bias/part_0save/Identity_65"/device:CPU:0*
dtype0
h
save/Identity_66Identitysave/RestoreV2_1:3"/device:CPU:0*
T0*
_output_shapes

: 
z
save/AssignVariableOp_9AssignVariableOpdnn/hiddenlayer_0/kernel/part_0save/Identity_66"/device:CPU:0*
dtype0
d
save/Identity_67Identitysave/RestoreV2_1:4"/device:CPU:0*
T0*
_output_shapes
:
?
save/AssignVariableOp_10AssignVariableOp)dnn/hiddenlayer_1/batchnorm_1/beta/part_0save/Identity_67"/device:CPU:0*
dtype0
d
save/Identity_68Identitysave/RestoreV2_1:5"/device:CPU:0*
T0*
_output_shapes
:
?
save/AssignVariableOp_11AssignVariableOp*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0save/Identity_68"/device:CPU:0*
dtype0
d
save/Identity_69Identitysave/RestoreV2_1:6"/device:CPU:0*
_output_shapes
:*
T0
y
save/AssignVariableOp_12AssignVariableOpdnn/hiddenlayer_1/bias/part_0save/Identity_69"/device:CPU:0*
dtype0
h
save/Identity_70Identitysave/RestoreV2_1:7"/device:CPU:0*
_output_shapes

: *
T0
{
save/AssignVariableOp_13AssignVariableOpdnn/hiddenlayer_1/kernel/part_0save/Identity_70"/device:CPU:0*
dtype0
d
save/Identity_71Identitysave/RestoreV2_1:8"/device:CPU:0*
_output_shapes
:*
T0
?
save/AssignVariableOp_14AssignVariableOp)dnn/hiddenlayer_2/batchnorm_2/beta/part_0save/Identity_71"/device:CPU:0*
dtype0
d
save/Identity_72Identitysave/RestoreV2_1:9"/device:CPU:0*
T0*
_output_shapes
:
?
save/AssignVariableOp_15AssignVariableOp*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0save/Identity_72"/device:CPU:0*
dtype0
e
save/Identity_73Identitysave/RestoreV2_1:10"/device:CPU:0*
_output_shapes
:*
T0
y
save/AssignVariableOp_16AssignVariableOpdnn/hiddenlayer_2/bias/part_0save/Identity_73"/device:CPU:0*
dtype0
i
save/Identity_74Identitysave/RestoreV2_1:11"/device:CPU:0*
_output_shapes

:*
T0
{
save/AssignVariableOp_17AssignVariableOpdnn/hiddenlayer_2/kernel/part_0save/Identity_74"/device:CPU:0*
dtype0
e
save/Identity_75Identitysave/RestoreV2_1:12"/device:CPU:0*
_output_shapes
:*
T0
r
save/AssignVariableOp_18AssignVariableOpdnn/logits/bias/part_0save/Identity_75"/device:CPU:0*
dtype0
i
save/Identity_76Identitysave/RestoreV2_1:13"/device:CPU:0*
T0*
_output_shapes

:
t
save/AssignVariableOp_19AssignVariableOpdnn/logits/kernel/part_0save/Identity_76"/device:CPU:0*
dtype0
?
save/restore_shard_1NoOp^save/AssignVariableOp_10^save/AssignVariableOp_11^save/AssignVariableOp_12^save/AssignVariableOp_13^save/AssignVariableOp_14^save/AssignVariableOp_15^save/AssignVariableOp_16^save/AssignVariableOp_17^save/AssignVariableOp_18^save/AssignVariableOp_19^save/AssignVariableOp_6^save/AssignVariableOp_7^save/AssignVariableOp_8^save/AssignVariableOp_9"/device:CPU:0
2
save/restore_all/NoOpNoOp^save/restore_shard
E
save/restore_all/NoOp_1NoOp^save/restore_shard_1"/device:CPU:0
J
save/restore_allNoOp^save/restore_all/NoOp^save/restore_all/NoOp_1?
?
?
Atf_data_experimental_parallel_interleave_filename_to_dataset_2578
arg0
experimentalcsvdataset2DWrapper for passing nested structures to and from tf.data functions.?H
compression_typeConst"/device:CPU:0*
valueB B *
dtype0Q
record_defaults_0Const"/device:CPU:0*
valueB*    *
dtype0Q
record_defaults_1Const"/device:CPU:0*
valueBBnull*
dtype0Q
record_defaults_2Const"/device:CPU:0*
valueB*    *
dtype0Q
record_defaults_3Const"/device:CPU:0*
dtype0*
valueBBnullQ
record_defaults_4Const"/device:CPU:0*
valueB*    *
dtype0Q
record_defaults_5Const"/device:CPU:0*
valueB*    *
dtype0Q
record_defaults_6Const"/device:CPU:0*
valueBBnull*
dtype0Q
record_defaults_7Const"/device:CPU:0*
valueBBnull*
dtype0Q
record_defaults_8Const"/device:CPU:0*
dtype0*
valueBBnullR
record_defaults_9Const"/device:CPU:0*
valueBBnokey*
dtype0G
buffer_sizeConst"/device:CPU:0*
valueB
	 R???*
dtype0	?
headerConst"/device:CPU:0*
value	B
 Z *
dtype0
D
field_delimConst"/device:CPU:0*
value	B B,*
dtype0H
use_quote_delimConst"/device:CPU:0*
dtype0
*
value	B
 Z@
na_valueConst"/device:CPU:0*
valueB B *
dtype0C
select_colsConst"/device:CPU:0*
valueB	 *
dtype0	?
ExperimentalCSVDatasetExperimentalCSVDatasetarg0compression_type:output:0buffer_size:output:0header:output:0field_delim:output:0use_quote_delim:output:0na_value:output:0select_cols:output:0record_defaults_0:output:0record_defaults_1:output:0record_defaults_2:output:0record_defaults_3:output:0record_defaults_4:output:0record_defaults_5:output:0record_defaults_6:output:0record_defaults_7:output:0record_defaults_8:output:0record_defaults_9:output:0"/device:CPU:0*'
output_shapes
: : : : : : : : : : *
output_types
2
"9
experimentalcsvdatasetExperimentalCSVDataset:handle:0
?
?
Dataset_map_<lambda>_2619

arg0_0

arg1_0

arg2_0

arg3_0

arg4_0

arg5_0

arg6_0

arg7_0

arg8_0

arg9_0
arg0
arg1
arg2
arg3
arg4
arg5
arg6
arg7
arg8
arg92DWrapper for passing nested structures to and from tf.data functions."
arg6arg6_0"
arg7arg7_0"
arg8arg8_0"
arg9arg9_0"
arg0arg0_0"
arg1arg1_0"
arg2arg2_0"
arg3arg3_0"
arg4arg4_0"
arg5arg5_0
?
?
Dataset_map_map_fn_2606

arg0_0

arg1_0

arg2_0

arg3_0

arg4_0

arg5_0

arg6_0

arg7_0

arg8_0

arg9_0
arg8
arg7
arg5
arg1
arg9
arg2
arg6
arg3
arg4
arg02DWrapper for passing nested structures to and from tf.data functions."
arg8arg8_0"
arg9arg9_0"
arg0arg0_0"
arg1arg1_0"
arg2arg2_0"
arg3arg3_0"
arg4arg4_0"
arg5arg5_0"
arg6arg6_0"
arg7arg7_0"??{??     ?eڛ	???V?(?AJ??
?@??
:
Add
x"T
y"T
z"T"
Ttype:
2	
h
All	
input

reduction_indices"Tidx

output
"
	keep_dimsbool( "
Tidxtype0:
2	
P
Assert
	condition
	
data2T"
T
list(type)(0"
	summarizeint?
x
Assign
ref"T?

value"T

output_ref"T?"	
Ttype"
validate_shapebool("
use_lockingbool(?
s
	AssignAdd
ref"T?

value"T

output_ref"T?" 
Ttype:
2	"
use_lockingbool( 
B
AssignVariableOp
resource
value"dtype"
dtypetype?
?
BatchDatasetV2
input_dataset

batch_size	
drop_remainder


handle"
output_types
list(type)(0" 
output_shapeslist(shape)(0
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
?
DenseToDenseSetOperation	
set1"T	
set2"T
result_indices	
result_values"T
result_shape	"
set_operationstring"
validate_indicesbool("
Ttype:
	2	
5
DivNoNan
x"T
y"T
z"T"
Ttype:
2
B
Equal
x"T
y"T
z
"
Ttype:
2	
?
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
?
%ExperimentalParallelInterleaveDataset
input_dataset
other_arguments2
Targuments
cycle_length	
block_length	

sloppy

buffer_output_elements	
prefetch_input_elements	

handle"	
ffunc"

Targuments
list(type)("
output_types
list(type)(0" 
output_shapeslist(shape)(0
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
p
GatherNd
params"Tparams
indices"Tindices
output"Tparams"
Tparamstype"
Tindicestype:
2	
?
GatherV2
params"Tparams
indices"Tindices
axis"Taxis
output"Tparams"
Tparamstype"
Tindicestype:
2	"
Taxistype:
2	
B
GreaterEqual
x"T
y"T
z
"
Ttype:
2	
?
HashTableV2
table_handle"
	containerstring "
shared_namestring "!
use_node_name_sharingbool( "
	key_dtypetype"
value_dtypetype?
V
HistogramSummary
tag
values"T
summary"
Ttype0:
2	
.
Identity

input"T
output"T"	
Ttype
N
IsVariableInitialized
ref"dtype?
is_initialized
"
dtypetype?
?
IteratorGetNext
iterator

components2output_types"
output_types
list(type)(0" 
output_shapeslist(shape)(0?
C
IteratorToStringHandle
resource_handle
string_handle?
?

IteratorV2

handle"
shared_namestring"
	containerstring"
output_types
list(type)(0" 
output_shapeslist(shape)(0?
?
	LessEqual
x"T
y"T
z
"
Ttype:
2	


LogicalNot
x

y

w
LookupTableFindV2
table_handle
keys"Tin
default_value"Tout
values"Tout"
Tintype"
Touttype?
b
LookupTableImportV2
table_handle
keys"Tin
values"Tout"
Tintype"
Touttype?
,
MakeIterator
dataset
iterator?
?

MapDataset
input_dataset
other_arguments2
Targuments

handle"	
ffunc"

Targuments
list(type)("
output_types
list(type)(0" 
output_shapeslist(shape)(0"$
use_inter_op_parallelismbool(" 
preserve_cardinalitybool( 
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
;
Maximum
x"T
y"T
z"T"
Ttype:

2	?
N
Merge
inputs"T*N
output"T
value_index"	
Ttype"
Nint(0
8
MergeSummary
inputs*N
summary"
Nint(0
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(?
o
ModelDataset
input_dataset

handle"
output_types
list(type)(0" 
output_shapeslist(shape)(0
=
Mul
x"T
y"T
z"T"
Ttype:
2	?

NoOp
E
NotEqual
x"T
y"T
z
"
Ttype:
2	
?
?
OptimizeDataset
input_dataset
optimizations

handle"
output_types
list(type)(0" 
output_shapeslist(shape)(0
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
X
PlaceholderWithDefault
input"dtype
output"dtype"
dtypetype"
shapeshape
6
Pow
x"T
y"T
z"T"
Ttype:

2	
?
PrefetchDataset
input_dataset
buffer_size	

handle"
output_types
list(type)(0" 
output_shapeslist(shape)(0
?
Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	?
a
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:	
2	
@
ReadVariableOp
resource
value"dtype"
dtypetype?
>
RealDiv
x"T
y"T
z"T"
Ttype:
2	
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
.
Rsqrt
x"T
y"T"
Ttype:

2
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
P
ScalarSummary
tags
values"T
summary"
Ttype:
2	
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
O
Size

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
a
Slice

input"T
begin"Index
size"Index
output"T"	
Ttype"
Indextype:
2	
?
SparseFillEmptyRows
indices	
values"T
dense_shape	
default_value"T
output_indices	
output_values"T
empty_row_indicator

reverse_index_map	"	
Ttype
h
SparseReshape
input_indices	
input_shape	
	new_shape	
output_indices	
output_shape	
z
SparseSegmentMean	
data"T
indices"Tidx
segment_ids
output"T"
Ttype:
2"
Tidxtype0:
2	
G
SquaredDifference
x"T
y"T
z"T"
Ttype:

2	?
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
?
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	
?
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
M
Switch	
data"T
pred

output_false"T
output_true"T"	
Ttype
?
TensorSliceDataset

components2Toutput_types

handle"
Toutput_types
list(type)(0" 
output_shapeslist(shape)(0?
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
?
TruncatedNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	?
P
Unique
x"T
y"T
idx"out_idx"	
Ttype"
out_idxtype0:
2	
q
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape?
9
VarIsInitializedOp
resource
is_initialized
?
s

VariableV2
ref"dtype?"
shapeshape"
dtypetype"
	containerstring "
shared_namestring ?
E
Where

input"T	
index	"%
Ttype0
:
2	

&
	ZerosLike
x"T
y"T"	
Ttype*1.13.12v1.13.0-rc2-5-g6612da8951??

global_step/Initializer/zerosConst*
_class
loc:@global_step*
value	B	 R *
dtype0	*
_output_shapes
: 
?
global_step
VariableV2*
dtype0	*
_output_shapes
: *
shared_name *
_class
loc:@global_step*
	container *
shape: 
?
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
T0	*
_class
loc:@global_step*
validate_shape(*
_output_shapes
: *
use_locking(
j
global_step/readIdentityglobal_step*
_output_shapes
: *
T0	*
_class
loc:@global_step
?
tensors/component_0Const"/device:CPU:0**
value!BBdata/eval-data-01.csv*
dtype0*
_output_shapes
:
]
cycle_lengthConst"/device:CPU:0*
value	B	 R*
dtype0	*
_output_shapes
: 
]
block_lengthConst"/device:CPU:0*
value	B	 R*
dtype0	*
_output_shapes
: 
W
sloppyConst"/device:CPU:0*
value	B
 Z*
dtype0
*
_output_shapes
: 
g
buffer_output_elementsConst"/device:CPU:0*
value	B	 R*
dtype0	*
_output_shapes
: 
h
prefetch_input_elementsConst"/device:CPU:0*
value	B	 R*
dtype0	*
_output_shapes
: 
\

batch_sizeConst"/device:CPU:0*
value
B	 R?*
dtype0	*
_output_shapes
: 
_
drop_remainderConst"/device:CPU:0*
value	B
 Z *
dtype0
*
_output_shapes
: 
e
buffer_sizeConst"/device:CPU:0*
valueB	 R
?????????*
dtype0	*
_output_shapes
: 
?
optimizationsConst*V
valueMBKBmap_and_batch_fusionBnoop_eliminationBshuffle_and_repeat_fusion*
dtype0*
_output_shapes
:
?

IteratorV2
IteratorV2*
output_types
2
*
shared_name *?
output_shapes?
?:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
	container *
_output_shapes
: 
?
TensorSliceDatasetTensorSliceDatasettensors/component_0*
output_shapes
: *
_class
loc:@IteratorV2*
Toutput_types
2*
_output_shapes
: 
?
%ExperimentalParallelInterleaveDataset%ExperimentalParallelInterleaveDatasetTensorSliceDatasetcycle_lengthblock_lengthsloppybuffer_output_elementsprefetch_input_elements*
output_types
2
*

Targuments
 *
_output_shapes
: *'
output_shapes
: : : : : : : : : : *
_class
loc:@IteratorV2*J
fERC
Atf_data_experimental_parallel_interleave_filename_to_dataset_2578
?
BatchDatasetV2BatchDatasetV2%ExperimentalParallelInterleaveDataset
batch_sizedrop_remainder*?
output_shapes?
?:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
_class
loc:@IteratorV2*
_output_shapes
: *
output_types
2

?

MapDataset
MapDatasetBatchDatasetV2*
_output_shapes
: *
preserve_cardinality( *?
output_shapes?
?:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
_class
loc:@IteratorV2* 
fR
Dataset_map_map_fn_2606*
output_types
2
*
use_inter_op_parallelism( *

Targuments
 
?
PrefetchDatasetPrefetchDataset
MapDatasetbuffer_size*
_output_shapes
: *
output_types
2
*?
output_shapes?
?:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
_class
loc:@IteratorV2
?
MapDataset_1
MapDatasetPrefetchDataset*?
output_shapes?
?:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
_class
loc:@IteratorV2*"
fR
Dataset_map_<lambda>_2619*
use_inter_op_parallelism(*
output_types
2
*

Targuments
 *
_output_shapes
: *
preserve_cardinality( 
?
OptimizeDatasetOptimizeDatasetMapDataset_1optimizations*
_output_shapes
: *
output_types
2
*?
output_shapes?
?:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
_class
loc:@IteratorV2
?
ModelDatasetModelDatasetOptimizeDataset*
output_types
2
*?
output_shapes?
?:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*
_class
loc:@IteratorV2*
_output_shapes
: 
U
MakeIteratorMakeIteratorModelDataset
IteratorV2*
_class
loc:@IteratorV2
T
IteratorToStringHandleIteratorToStringHandle
IteratorV2*
_output_shapes
: 
?
IteratorGetNextIteratorGetNext
IteratorV2*
output_types
2
*?
output_shapes?
?:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????*?
_output_shapes?
?:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????:?????????
c
ExponentialDecay/learning_rateConst*
dtype0*
_output_shapes
: *
valueB
 *o?:
Z
ExponentialDecay/Cast/xConst*
value
B :?*
dtype0*
_output_shapes
: 
v
ExponentialDecay/CastCastExponentialDecay/Cast/x*

SrcT0*
Truncate( *

DstT0*
_output_shapes
: 
^
ExponentialDecay/Cast_1/xConst*
valueB
 *  ??*
dtype0*
_output_shapes
: 
q
ExponentialDecay/Cast_2Castglobal_step/read*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
: 
t
ExponentialDecay/truedivRealDivExponentialDecay/Cast_2ExponentialDecay/Cast*
_output_shapes
: *
T0
q
ExponentialDecay/PowPowExponentialDecay/Cast_1/xExponentialDecay/truediv*
T0*
_output_shapes
: 
n
ExponentialDecayMulExponentialDecay/learning_rateExponentialDecay/Pow*
T0*
_output_shapes
: 
`
learning_rate/tagsConst*
valueB Blearning_rate*
dtype0*
_output_shapes
: 
e
learning_rateScalarSummarylearning_rate/tagsExponentialDecay*
T0*
_output_shapes
: 
?
|dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/shapeConst*
dtype0*
_output_shapes
:*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
valueB"      
?
{dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/meanConst*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
valueB
 *    *
dtype0*
_output_shapes
: 
?
}dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddevConst*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
valueB
 *?5?*
dtype0*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormalTruncatedNormal|dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/shape*
dtype0*
_output_shapes

:*
seedޱ?	*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
seed2'
?
zdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/mulMul?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormal}dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddev*
_output_shapes

:*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0
?
vdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normalAddzdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/mul{dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/mean*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
_output_shapes

:
?
Ydnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0
VariableV2*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
	container *
shape
:*
dtype0*
_output_shapes

:*
shared_name 
?
`dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/AssignAssignYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0vdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal*
validate_shape(*
_output_shapes

:*
use_locking(*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0
?
^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/readIdentityYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
_output_shapes

:*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0
?
~dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/shapeConst*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
valueB"      *
dtype0*
_output_shapes
:
?
}dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/meanConst*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
valueB
 *    *
dtype0*
_output_shapes
: 
?
dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddevConst*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
valueB
 *?5?*
dtype0*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormalTruncatedNormal~dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/shape*
dtype0*
_output_shapes

:*
seedޱ?	*
T0*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
seed20
?
|dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/mulMul?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormaldnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddev*
T0*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
_output_shapes

:
?
xdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normalAdd|dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/mul}dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/mean*
_output_shapes

:*
T0*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0
?
[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0
VariableV2*
dtype0*
_output_shapes

:*
shared_name *n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
	container *
shape
:
?
bdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/AssignAssign[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0xdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal*
use_locking(*
T0*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
validate_shape(*
_output_shapes

:
?
`dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/readIdentity[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
T0*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
_output_shapes

:
?
xdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/shapeConst*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
valueB"      *
dtype0*
_output_shapes
:
?
wdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/meanConst*
dtype0*
_output_shapes
: *h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
valueB
 *    
?
ydnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddevConst*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
valueB
 *?5?*
dtype0*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormalTruncatedNormalxdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/shape*
seed29*
dtype0*
_output_shapes

:*
seedޱ?	*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0
?
vdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/mulMul?dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormalydnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddev*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
_output_shapes

:
?
rdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normalAddvdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/mulwdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/mean*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
_output_shapes

:
?
Udnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0
VariableV2*
shared_name *h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
	container *
shape
:*
dtype0*
_output_shapes

:
?
\dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/AssignAssignUdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0rdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal*
use_locking(*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
validate_shape(*
_output_shapes

:
?
Zdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/readIdentityUdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
_output_shapes

:*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0
?
dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal/shapeConst*o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
valueB"      *
dtype0*
_output_shapes
:
?
~dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal/meanConst*o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
valueB
 *    *
dtype0*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddevConst*
dtype0*
_output_shapes
: *o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
valueB
 *?5?
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormalTruncatedNormaldnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal/shape*
dtype0*
_output_shapes

:*
seedޱ?	*
T0*o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
seed2B
?
}dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal/mulMul?dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormal?dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddev*
T0*o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
_output_shapes

:
?
ydnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normalAdd}dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal/mul~dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal/mean*
T0*o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
_output_shapes

:
?
\dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0
VariableV2*
dtype0*
_output_shapes

:*
shared_name *o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
	container *
shape
:
?
cdnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/AssignAssign\dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0ydnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal*
T0*o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
validate_shape(*
_output_shapes

:*
use_locking(
?
adnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/readIdentity\dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
_output_shapes

:*
T0*o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0
?
|dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/shapeConst*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
valueB"      *
dtype0*
_output_shapes
:
?
{dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/meanConst*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
valueB
 *    *
dtype0*
_output_shapes
: 
?
}dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddevConst*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
valueB
 *   ?*
dtype0*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormalTruncatedNormal|dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/shape*
dtype0*
_output_shapes

:*
seedޱ?	*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
seed2K
?
zdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/mulMul?dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormal}dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddev*
_output_shapes

:*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0
?
vdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normalAddzdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/mul{dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/mean*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
_output_shapes

:
?
Ydnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0
VariableV2*
shared_name *l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
	container *
shape
:*
dtype0*
_output_shapes

:
?
`dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/AssignAssignYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0vdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal*
use_locking(*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
validate_shape(*
_output_shapes

:
?
^dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/readIdentityYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
_output_shapes

:
?
Odnn/input_from_feature_columns/input_layer/alcohol_use_embedding/ExpandDims/dimConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
?
Kdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/ExpandDims
ExpandDimsIteratorGetNextOdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/ExpandDims/dim*
T0*'
_output_shapes
:?????????*

Tdim0
?
_dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/ignore_value/xConst*
dtype0*
_output_shapes
: *
valueB B 
?
Ydnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/NotEqualNotEqualKdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/ExpandDims_dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/ignore_value/x*
T0*'
_output_shapes
:?????????
?
Xdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/indicesWhereYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/NotEqual*
T0
*'
_output_shapes
:?????????
?
Wdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/valuesGatherNdKdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/ExpandDimsXdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/indices*
Tparams0*#
_output_shapes
:?????????*
Tindices0	
?
\dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/dense_shapeShapeKdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/ExpandDims*
T0*
out_type0	*
_output_shapes
:
?
Ydnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/ConstConst*&
valueBBTrueBFalseBNone*
dtype0*
_output_shapes
:
?
Xdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/SizeConst*
value	B :*
dtype0*
_output_shapes
: 
?
_dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
?
_dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
Ydnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/rangeRange_dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/range/startXdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/Size_dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/range/delta*

Tidx0*
_output_shapes
:
?
[dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/ToInt64CastYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/range*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
:
?
ddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/hash_table/ConstConst*
dtype0	*
_output_shapes
: *
valueB	 R
?????????
?
^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/hash_tableHashTableV2*
use_node_name_sharing( *
	key_dtype0*
	container *
value_dtype0	*
_output_shapes
: *
shared_name 
?
idnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/hash_table/table_initLookupTableImportV2^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/hash_tableYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/Const[dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/ToInt64*	
Tin0*

Tout0	
?
Rdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/hash_table_LookupLookupTableFindV2^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/hash_tableWdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/valuesddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/hash_table/Const*	
Tin0*#
_output_shapes
:?????????*

Tout0	
?
jdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:
?
idnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
?
ddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SliceSlice\dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/dense_shapejdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice/beginidnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice/size*
T0	*
Index0*
_output_shapes
:
?
ddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
?
cdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/ProdProdddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Sliceddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Const*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0	
?
odnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2/indicesConst*
value	B :*
dtype0*
_output_shapes
: 
?
ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
gdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2GatherV2\dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/dense_shapeodnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2/indicesldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2/axis*
Tparams0	*
_output_shapes
: *
Taxis0*
Tindices0
?
ednn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Cast/xPackcdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Prodgdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2*
T0	*

axis *
N*
_output_shapes
:
?
ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseReshapeSparseReshapeXdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/indices\dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/dense_shapeednn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Cast/x*-
_output_shapes
:?????????:
?
udnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseReshape/IdentityIdentityRdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/hash_table_Lookup*
T0	*#
_output_shapes
:?????????
?
mdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
?
kdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GreaterEqualGreaterEqualudnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseReshape/Identitymdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GreaterEqual/y*#
_output_shapes
:?????????*
T0	
?
ddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/WhereWherekdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GreaterEqual*
T0
*'
_output_shapes
:?????????
?
ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape/shapeConst*
valueB:
?????????*
dtype0*
_output_shapes
:
?
fdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/ReshapeReshapeddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Whereldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:?????????
?
ndnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
idnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2_1GatherV2ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseReshapefdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshapendnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2_1/axis*'
_output_shapes
:?????????*
Taxis0*
Tindices0	*
Tparams0	
?
ndnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2_2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
?
idnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2_2GatherV2udnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseReshape/Identityfdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshapendnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2_2/axis*#
_output_shapes
:?????????*
Taxis0*
Tindices0	*
Tparams0	
?
gdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/IdentityIdentityndnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseReshape:1*
_output_shapes
:*
T0	
?
xdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsidnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2_1idnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2_2gdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Identityxdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:?????????:?????????:?????????:?????????
?
?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlice?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
end_mask*#
_output_shapes
:?????????*
T0	*
Index0*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask 
?
{dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/CastCast?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *

DstT0*#
_output_shapes
:?????????
?
}dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/UniqueUnique?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*
out_idx0*2
_output_shapes 
:?????????:?????????
?
?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/axisConst*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
value	B : *
dtype0*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/embedding_lookupGatherV2^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/read}dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/Unique?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/axis*'
_output_shapes
:?????????*
Taxis0*
Tindices0	*
Tparams0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0
?
?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentity?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:?????????
?
vdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparseSparseSegmentMean?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identitydnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/Unique:1{dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:?????????
?
ndnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape_1/shapeConst*
valueB"????   *
dtype0*
_output_shapes
:
?
hdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape_1Reshape?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:2ndnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:?????????
?
ddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/ShapeShapevdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
?
rdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
?
tdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
tdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_sliceStridedSliceddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Shaperdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_slice/stacktdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_slice/stack_1tdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_slice/stack_2*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
?
fdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
?
ddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/stackPackfdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/stack/0ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_slice*
N*
_output_shapes
:*
T0*

axis 
?
cdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/TileTilehdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape_1ddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/stack*
T0
*0
_output_shapes
:??????????????????*

Tmultiples0
?
idnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/zeros_like	ZerosLikevdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
?
^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weightsSelectcdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Tileidnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/zeros_likevdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
?
ednn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Cast_1Cast\dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/dense_shape*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
:
?
ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:
?
kdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
?
fdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_1Sliceednn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Cast_1ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_1/beginkdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_1/size*
T0*
Index0*
_output_shapes
:
?
fdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Shape_1Shape^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights*
T0*
out_type0*
_output_shapes
:
?
ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB:
?
kdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_2/sizeConst*
valueB:
?????????*
dtype0*
_output_shapes
:
?
fdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_2Slicefdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Shape_1ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_2/beginkdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_2/size*
T0*
Index0*
_output_shapes
:
?
jdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
ednn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/concatConcatV2fdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_1fdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice_2jdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/concat/axis*
N*
_output_shapes
:*

Tidx0*
T0
?
hdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape_2Reshape^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weightsednn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/concat*
T0*
Tshape0*'
_output_shapes
:?????????
?
Fdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/ShapeShapehdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape_2*
T0*
out_type0*
_output_shapes
:
?
Tdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
?
Vdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
Vdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
Ndnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_sliceStridedSliceFdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/ShapeTdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_slice/stackVdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_slice/stack_1Vdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
?
Pdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
?
Ndnn/input_from_feature_columns/input_layer/alcohol_use_embedding/Reshape/shapePackNdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_slicePdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/Reshape/shape/1*
N*
_output_shapes
:*
T0*

axis 
?
Hdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/ReshapeReshapehdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape_2Ndnn/input_from_feature_columns/input_layer/alcohol_use_embedding/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:?????????
?
Qdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/ExpandDims/dimConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
?
Mdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/ExpandDims
ExpandDimsIteratorGetNext:1Qdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/ExpandDims/dim*'
_output_shapes
:?????????*

Tdim0*
T0
?
adnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/ignore_value/xConst*
valueB B *
dtype0*
_output_shapes
: 
?
[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/NotEqualNotEqualMdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/ExpandDimsadnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/ignore_value/x*'
_output_shapes
:?????????*
T0
?
Zdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/indicesWhere[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/NotEqual*
T0
*'
_output_shapes
:?????????
?
Ydnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/valuesGatherNdMdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/ExpandDimsZdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/indices*#
_output_shapes
:?????????*
Tindices0	*
Tparams0
?
^dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/dense_shapeShapeMdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/ExpandDims*
T0*
out_type0	*
_output_shapes
:
?
]dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/ConstConst*
dtype0*
_output_shapes
:*&
valueBBTrueBFalseBNone
?
\dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/SizeConst*
dtype0*
_output_shapes
: *
value	B :
?
cdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
?
cdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
?
]dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/rangeRangecdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/range/start\dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/Sizecdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/range/delta*

Tidx0*
_output_shapes
:
?
_dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/ToInt64Cast]dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/range*
Truncate( *

DstT0	*
_output_shapes
:*

SrcT0
?
hdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/hash_table/ConstConst*
dtype0	*
_output_shapes
: *
valueB	 R
?????????
?
bdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/hash_tableHashTableV2*
	key_dtype0*
	container *
value_dtype0	*
_output_shapes
: *
shared_name *
use_node_name_sharing( 
?
mdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/hash_table/table_initLookupTableImportV2bdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/hash_table]dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/Const_dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/ToInt64*	
Tin0*

Tout0	
?
Tdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/hash_table_LookupLookupTableFindV2bdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/hash_tableYdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/valueshdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/hash_table/Const*	
Tin0*#
_output_shapes
:?????????*

Tout0	
?
ndnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:
?
mdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
?
hdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SliceSlice^dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/dense_shapendnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice/beginmdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice/size*
_output_shapes
:*
T0	*
Index0
?
hdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/ConstConst*
valueB: *
dtype0*
_output_shapes
:
?
gdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/ProdProdhdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slicehdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Const*
T0	*
_output_shapes
: *

Tidx0*
	keep_dims( 
?
sdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2/indicesConst*
value	B :*
dtype0*
_output_shapes
: 
?
pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
kdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2GatherV2^dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/dense_shapesdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2/indicespdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2/axis*
Taxis0*
Tindices0*
Tparams0	*
_output_shapes
: 
?
idnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Cast/xPackgdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Prodkdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2*
T0	*

axis *
N*
_output_shapes
:
?
pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseReshapeSparseReshapeZdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/indices^dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/dense_shapeidnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Cast/x*-
_output_shapes
:?????????:
?
ydnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseReshape/IdentityIdentityTdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/hash_table_Lookup*
T0	*#
_output_shapes
:?????????
?
qdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
?
odnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GreaterEqualGreaterEqualydnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseReshape/Identityqdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GreaterEqual/y*
T0	*#
_output_shapes
:?????????
?
hdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/WhereWhereodnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GreaterEqual*
T0
*'
_output_shapes
:?????????
?
pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
?????????
?
jdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/ReshapeReshapehdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Wherepdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:?????????
?
rdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
mdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2_1GatherV2pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseReshapejdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshaperdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2_1/axis*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????*
Taxis0
?
rdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
mdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2_2GatherV2ydnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseReshape/Identityjdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshaperdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2_2/axis*
Taxis0*
Tindices0	*
Tparams0	*#
_output_shapes
:?????????
?
kdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/IdentityIdentityrdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseReshape:1*
T0	*
_output_shapes
:
?
|dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsmdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2_1mdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2_2kdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Identity|dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:?????????:?????????:?????????:?????????
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlice?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*#
_output_shapes
:?????????*
T0	*
Index0
?
dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/CastCast?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *

DstT0*#
_output_shapes
:?????????
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/UniqueUnique?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*2
_output_shapes 
:?????????:?????????*
T0	*
out_idx0
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/axisConst*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
value	B : *
dtype0*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/embedding_lookupGatherV2`dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/read?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/Unique?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/axis*
Tparams0*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*'
_output_shapes
:?????????*
Taxis0*
Tindices0	
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentity?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:?????????
?
zdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparseSparseSegmentMean?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/Unique:1dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/Cast*
T0*'
_output_shapes
:?????????*

Tidx0
?
rdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"????   
?
ldnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape_1Reshape?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:2rdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:?????????
?
hdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/ShapeShapezdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse*
_output_shapes
:*
T0*
out_type0
?
vdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
?
xdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
xdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/strided_sliceStridedSlicehdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Shapevdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/strided_slice/stackxdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/strided_slice/stack_1xdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/strided_slice/stack_2*
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask 
?
jdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
?
hdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/stackPackjdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/stack/0pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/strided_slice*
T0*

axis *
N*
_output_shapes
:
?
gdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/TileTileldnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape_1hdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/stack*

Tmultiples0*
T0
*0
_output_shapes
:??????????????????
?
mdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/zeros_like	ZerosLikezdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
?
bdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weightsSelectgdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Tilemdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/zeros_likezdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
?
idnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Cast_1Cast^dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/dense_shape*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
:
?
pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_1/beginConst*
dtype0*
_output_shapes
:*
valueB: 
?
odnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_1/sizeConst*
dtype0*
_output_shapes
:*
valueB:
?
jdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_1Sliceidnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Cast_1pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_1/beginodnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_1/size*
_output_shapes
:*
T0*
Index0
?
jdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Shape_1Shapebdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights*
T0*
out_type0*
_output_shapes
:
?
pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:
?
odnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_2/sizeConst*
valueB:
?????????*
dtype0*
_output_shapes
:
?
jdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_2Slicejdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Shape_1pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_2/beginodnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_2/size*
T0*
Index0*
_output_shapes
:
?
ndnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
idnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/concatConcatV2jdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_1jdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_2ndnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
?
ldnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape_2Reshapebdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weightsidnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/concat*
T0*
Tshape0*'
_output_shapes
:?????????
?
Hdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/ShapeShapeldnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape_2*
T0*
out_type0*
_output_shapes
:
?
Vdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
?
Xdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
Xdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
Pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/strided_sliceStridedSliceHdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/ShapeVdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/strided_slice/stackXdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/strided_slice/stack_1Xdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/strided_slice/stack_2*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
?
Rdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
?
Pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/Reshape/shapePackPdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/strided_sliceRdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:
?
Jdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/ReshapeReshapeldnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape_2Pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:?????????
?
Idnn/input_from_feature_columns/input_layer/gestation_weeks/ExpandDims/dimConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
?
Ednn/input_from_feature_columns/input_layer/gestation_weeks/ExpandDims
ExpandDimsIteratorGetNext:2Idnn/input_from_feature_columns/input_layer/gestation_weeks/ExpandDims/dim*

Tdim0*
T0*'
_output_shapes
:?????????
?
@dnn/input_from_feature_columns/input_layer/gestation_weeks/ShapeShapeEdnn/input_from_feature_columns/input_layer/gestation_weeks/ExpandDims*
_output_shapes
:*
T0*
out_type0
?
Ndnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
?
Pdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
?
Pdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
Hdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_sliceStridedSlice@dnn/input_from_feature_columns/input_layer/gestation_weeks/ShapeNdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stackPdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stack_1Pdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
?
Jdnn/input_from_feature_columns/input_layer/gestation_weeks/Reshape/shape/1Const*
dtype0*
_output_shapes
: *
value	B :
?
Hdnn/input_from_feature_columns/input_layer/gestation_weeks/Reshape/shapePackHdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_sliceJdnn/input_from_feature_columns/input_layer/gestation_weeks/Reshape/shape/1*
N*
_output_shapes
:*
T0*

axis 
?
Bdnn/input_from_feature_columns/input_layer/gestation_weeks/ReshapeReshapeEdnn/input_from_feature_columns/input_layer/gestation_weeks/ExpandDimsHdnn/input_from_feature_columns/input_layer/gestation_weeks/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:?????????
?
Kdnn/input_from_feature_columns/input_layer/is_male_embedding/ExpandDims/dimConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
?
Gdnn/input_from_feature_columns/input_layer/is_male_embedding/ExpandDims
ExpandDimsIteratorGetNext:3Kdnn/input_from_feature_columns/input_layer/is_male_embedding/ExpandDims/dim*

Tdim0*
T0*'
_output_shapes
:?????????
?
[dnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/ignore_value/xConst*
dtype0*
_output_shapes
: *
valueB B 
?
Udnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/NotEqualNotEqualGdnn/input_from_feature_columns/input_layer/is_male_embedding/ExpandDims[dnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/ignore_value/x*'
_output_shapes
:?????????*
T0
?
Tdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/indicesWhereUdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/NotEqual*
T0
*'
_output_shapes
:?????????
?
Sdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/valuesGatherNdGdnn/input_from_feature_columns/input_layer/is_male_embedding/ExpandDimsTdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/indices*#
_output_shapes
:?????????*
Tindices0	*
Tparams0
?
Xdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/dense_shapeShapeGdnn/input_from_feature_columns/input_layer/is_male_embedding/ExpandDims*
_output_shapes
:*
T0*
out_type0	
?
Qdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/ConstConst* 
valueBBTrueBFalse*
dtype0*
_output_shapes
:
?
Pdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/SizeConst*
value	B :*
dtype0*
_output_shapes
: 
?
Wdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
?
Wdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
Qdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/rangeRangeWdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/range/startPdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/SizeWdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/range/delta*

Tidx0*
_output_shapes
:
?
Sdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/ToInt64CastQdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/range*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
:
?
\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/hash_table/ConstConst*
dtype0	*
_output_shapes
: *
valueB	 R
?????????
?
Vdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/hash_tableHashTableV2*
use_node_name_sharing( *
	key_dtype0*
	container *
value_dtype0	*
_output_shapes
: *
shared_name 
?
adnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/hash_table/table_initLookupTableImportV2Vdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/hash_tableQdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/ConstSdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/ToInt64*	
Tin0*

Tout0	
?
Ndnn/input_from_feature_columns/input_layer/is_male_embedding/hash_table_LookupLookupTableFindV2Vdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/hash_tableSdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/values\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/hash_table/Const*	
Tin0*#
_output_shapes
:?????????*

Tout0	
?
bdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:
?
adnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
?
\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SliceSliceXdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/dense_shapebdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice/beginadnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice/size*
T0	*
Index0*
_output_shapes
:
?
\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/ConstConst*
valueB: *
dtype0*
_output_shapes
:
?
[dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/ProdProd\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Const*
T0	*
_output_shapes
: *

Tidx0*
	keep_dims( 
?
gdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2/indicesConst*
dtype0*
_output_shapes
: *
value	B :
?
ddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
_dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2GatherV2Xdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/dense_shapegdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2/indicesddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2/axis*
Taxis0*
Tindices0*
Tparams0	*
_output_shapes
: 
?
]dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Cast/xPack[dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Prod_dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2*
T0	*

axis *
N*
_output_shapes
:
?
ddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseReshapeSparseReshapeTdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/indicesXdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/dense_shape]dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Cast/x*-
_output_shapes
:?????????:
?
mdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseReshape/IdentityIdentityNdnn/input_from_feature_columns/input_layer/is_male_embedding/hash_table_Lookup*#
_output_shapes
:?????????*
T0	
?
ednn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
?
cdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GreaterEqualGreaterEqualmdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseReshape/Identityednn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GreaterEqual/y*
T0	*#
_output_shapes
:?????????
?
\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/WhereWherecdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GreaterEqual*
T0
*'
_output_shapes
:?????????
?
ddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
?????????
?
^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/ReshapeReshape\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Whereddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:?????????
?
fdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
adnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2_1GatherV2ddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseReshape^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshapefdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2_1/axis*
Tparams0	*'
_output_shapes
:?????????*
Taxis0*
Tindices0	
?
fdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
adnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2_2GatherV2mdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseReshape/Identity^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshapefdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2_2/axis*
Tindices0	*
Tparams0	*#
_output_shapes
:?????????*
Taxis0
?
_dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/IdentityIdentityfdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseReshape:1*
T0	*
_output_shapes
:
?
pdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 
?
~dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsadnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2_1adnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2_2_dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Identitypdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseFillEmptyRows/Const*T
_output_shapesB
@:?????????:?????????:?????????:?????????*
T0	
?
?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
?
?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
?
|dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlice~dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/strided_slice/stack?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
shrink_axis_mask*
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask*#
_output_shapes
:?????????*
Index0*
T0	
?
sdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/CastCast|dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *

DstT0*#
_output_shapes
:?????????
?
udnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/UniqueUnique?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*
out_idx0*2
_output_shapes 
:?????????:?????????
?
?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/embedding_lookup/axisConst*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
value	B : *
dtype0*
_output_shapes
: 
?
dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/embedding_lookupGatherV2Zdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/readudnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/Unique?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/embedding_lookup/axis*
Tindices0	*
Tparams0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*'
_output_shapes
:?????????*
Taxis0
?
?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentitydnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/embedding_lookup*'
_output_shapes
:?????????*
T0
?
ndnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparseSparseSegmentMean?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identitywdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/Unique:1sdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/Cast*
T0*'
_output_shapes
:?????????*

Tidx0
?
fdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshape_1/shapeConst*
valueB"????   *
dtype0*
_output_shapes
:
?
`dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshape_1Reshape?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:2fdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshape_1/shape*'
_output_shapes
:?????????*
T0
*
Tshape0
?
\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/ShapeShapendnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
?
jdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
?
ldnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
ldnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
ddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/strided_sliceStridedSlice\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Shapejdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/strided_slice/stackldnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/strided_slice/stack_1ldnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
?
^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
?
\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/stackPack^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/stack/0ddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/strided_slice*
T0*

axis *
N*
_output_shapes
:
?
[dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/TileTile`dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshape_1\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/stack*

Tmultiples0*
T0
*0
_output_shapes
:??????????????????
?
adnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/zeros_like	ZerosLikendnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
?
Vdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weightsSelect[dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Tileadnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/zeros_likendnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
?
]dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Cast_1CastXdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/dense_shape*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
:
?
ddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:
?
cdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_1/sizeConst*
dtype0*
_output_shapes
:*
valueB:
?
^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_1Slice]dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Cast_1ddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_1/begincdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_1/size*
T0*
Index0*
_output_shapes
:
?
^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Shape_1ShapeVdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights*
T0*
out_type0*
_output_shapes
:
?
ddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:
?
cdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_2/sizeConst*
valueB:
?????????*
dtype0*
_output_shapes
:
?
^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_2Slice^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Shape_1ddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_2/begincdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_2/size*
T0*
Index0*
_output_shapes
:
?
bdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
?
]dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/concatConcatV2^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_1^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_2bdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
?
`dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshape_2ReshapeVdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights]dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/concat*
T0*
Tshape0*'
_output_shapes
:?????????
?
Bdnn/input_from_feature_columns/input_layer/is_male_embedding/ShapeShape`dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshape_2*
_output_shapes
:*
T0*
out_type0
?
Pdnn/input_from_feature_columns/input_layer/is_male_embedding/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
?
Rdnn/input_from_feature_columns/input_layer/is_male_embedding/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
Rdnn/input_from_feature_columns/input_layer/is_male_embedding/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
Jdnn/input_from_feature_columns/input_layer/is_male_embedding/strided_sliceStridedSliceBdnn/input_from_feature_columns/input_layer/is_male_embedding/ShapePdnn/input_from_feature_columns/input_layer/is_male_embedding/strided_slice/stackRdnn/input_from_feature_columns/input_layer/is_male_embedding/strided_slice/stack_1Rdnn/input_from_feature_columns/input_layer/is_male_embedding/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
?
Ldnn/input_from_feature_columns/input_layer/is_male_embedding/Reshape/shape/1Const*
dtype0*
_output_shapes
: *
value	B :
?
Jdnn/input_from_feature_columns/input_layer/is_male_embedding/Reshape/shapePackJdnn/input_from_feature_columns/input_layer/is_male_embedding/strided_sliceLdnn/input_from_feature_columns/input_layer/is_male_embedding/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:
?
Ddnn/input_from_feature_columns/input_layer/is_male_embedding/ReshapeReshape`dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshape_2Jdnn/input_from_feature_columns/input_layer/is_male_embedding/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:?????????
?
Ddnn/input_from_feature_columns/input_layer/mother_age/ExpandDims/dimConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
?
@dnn/input_from_feature_columns/input_layer/mother_age/ExpandDims
ExpandDimsIteratorGetNext:5Ddnn/input_from_feature_columns/input_layer/mother_age/ExpandDims/dim*'
_output_shapes
:?????????*

Tdim0*
T0
?
;dnn/input_from_feature_columns/input_layer/mother_age/ShapeShape@dnn/input_from_feature_columns/input_layer/mother_age/ExpandDims*
T0*
out_type0*
_output_shapes
:
?
Idnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
?
Kdnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
Kdnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
Cdnn/input_from_feature_columns/input_layer/mother_age/strided_sliceStridedSlice;dnn/input_from_feature_columns/input_layer/mother_age/ShapeIdnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stackKdnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stack_1Kdnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stack_2*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
?
Ednn/input_from_feature_columns/input_layer/mother_age/Reshape/shape/1Const*
dtype0*
_output_shapes
: *
value	B :
?
Cdnn/input_from_feature_columns/input_layer/mother_age/Reshape/shapePackCdnn/input_from_feature_columns/input_layer/mother_age/strided_sliceEdnn/input_from_feature_columns/input_layer/mother_age/Reshape/shape/1*
N*
_output_shapes
:*
T0*

axis 
?
=dnn/input_from_feature_columns/input_layer/mother_age/ReshapeReshape@dnn/input_from_feature_columns/input_layer/mother_age/ExpandDimsCdnn/input_from_feature_columns/input_layer/mother_age/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:?????????
?
Rdnn/input_from_feature_columns/input_layer/mother_married_embedding/ExpandDims/dimConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
?
Ndnn/input_from_feature_columns/input_layer/mother_married_embedding/ExpandDims
ExpandDimsIteratorGetNext:6Rdnn/input_from_feature_columns/input_layer/mother_married_embedding/ExpandDims/dim*'
_output_shapes
:?????????*

Tdim0*
T0
?
bdnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/ignore_value/xConst*
valueB B *
dtype0*
_output_shapes
: 
?
\dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/NotEqualNotEqualNdnn/input_from_feature_columns/input_layer/mother_married_embedding/ExpandDimsbdnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/ignore_value/x*
T0*'
_output_shapes
:?????????
?
[dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/indicesWhere\dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/NotEqual*
T0
*'
_output_shapes
:?????????
?
Zdnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/valuesGatherNdNdnn/input_from_feature_columns/input_layer/mother_married_embedding/ExpandDims[dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/indices*
Tindices0	*
Tparams0*#
_output_shapes
:?????????
?
_dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/dense_shapeShapeNdnn/input_from_feature_columns/input_layer/mother_married_embedding/ExpandDims*
T0*
out_type0	*
_output_shapes
:
?
_dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/ConstConst* 
valueBBTrueBFalse*
dtype0*
_output_shapes
:
?
^dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/SizeConst*
value	B :*
dtype0*
_output_shapes
: 
?
ednn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
?
ednn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
_dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/rangeRangeednn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/range/start^dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/Sizeednn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/range/delta*
_output_shapes
:*

Tidx0
?
adnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/ToInt64Cast_dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/range*
Truncate( *

DstT0	*
_output_shapes
:*

SrcT0
?
jdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/hash_table/ConstConst*
valueB	 R
?????????*
dtype0	*
_output_shapes
: 
?
ddnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/hash_tableHashTableV2*
shared_name *
use_node_name_sharing( *
	key_dtype0*
	container *
value_dtype0	*
_output_shapes
: 
?
odnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/hash_table/table_initLookupTableImportV2ddnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/hash_table_dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/Constadnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/ToInt64*	
Tin0*

Tout0	
?
Udnn/input_from_feature_columns/input_layer/mother_married_embedding/hash_table_LookupLookupTableFindV2ddnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/hash_tableZdnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/valuesjdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/hash_table/Const*

Tout0	*	
Tin0*#
_output_shapes
:?????????
?
pdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:
?
odnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
?
jdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SliceSlice_dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/dense_shapepdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice/beginodnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice/size*
T0	*
Index0*
_output_shapes
:
?
jdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/ConstConst*
valueB: *
dtype0*
_output_shapes
:
?
idnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/ProdProdjdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slicejdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Const*
T0	*
_output_shapes
: *

Tidx0*
	keep_dims( 
?
udnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2/indicesConst*
value	B :*
dtype0*
_output_shapes
: 
?
rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
mdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2GatherV2_dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/dense_shapeudnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2/indicesrdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2/axis*
Tparams0	*
_output_shapes
: *
Taxis0*
Tindices0
?
kdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Cast/xPackidnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Prodmdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2*
T0	*

axis *
N*
_output_shapes
:
?
rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseReshapeSparseReshape[dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/indices_dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/dense_shapekdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Cast/x*-
_output_shapes
:?????????:
?
{dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseReshape/IdentityIdentityUdnn/input_from_feature_columns/input_layer/mother_married_embedding/hash_table_Lookup*
T0	*#
_output_shapes
:?????????
?
sdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
?
qdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GreaterEqualGreaterEqual{dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseReshape/Identitysdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GreaterEqual/y*
T0	*#
_output_shapes
:?????????
?
jdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/WhereWhereqdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GreaterEqual*
T0
*'
_output_shapes
:?????????
?
rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
?????????
?
ldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/ReshapeReshapejdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Whererdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:?????????
?
tdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
odnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2_1GatherV2rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseReshapeldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshapetdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2_1/axis*
Tparams0	*'
_output_shapes
:?????????*
Taxis0*
Tindices0	
?
tdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2_2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
?
odnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2_2GatherV2{dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseReshape/Identityldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshapetdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2_2/axis*
Tparams0	*#
_output_shapes
:?????????*
Taxis0*
Tindices0	
?
mdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/IdentityIdentitytdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseReshape:1*
T0	*
_output_shapes
:
?
~dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsodnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2_1odnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2_2mdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Identity~dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseFillEmptyRows/Const*T
_output_shapesB
@:?????????:?????????:?????????:?????????*
T0	
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlice?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/strided_slice/stack?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
shrink_axis_mask*
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask*#
_output_shapes
:?????????*
Index0*
T0	
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/CastCast?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *

DstT0*#
_output_shapes
:?????????
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/UniqueUnique?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*2
_output_shapes 
:?????????:?????????*
T0	*
out_idx0
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/embedding_lookup/axisConst*o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
value	B : *
dtype0*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/embedding_lookupGatherV2adnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/read?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/Unique?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/embedding_lookup/axis*
Tindices0	*
Tparams0*o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*'
_output_shapes
:?????????*
Taxis0
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentity?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:?????????
?
|dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparseSparseSegmentMean?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/Unique:1?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/Cast*
T0*'
_output_shapes
:?????????*

Tidx0
?
tdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"????   
?
ndnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshape_1Reshape?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:2tdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:?????????
?
jdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/ShapeShape|dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse*
_output_shapes
:*
T0*
out_type0
?
xdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
?
zdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
zdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/strided_sliceStridedSlicejdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Shapexdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/strided_slice/stackzdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/strided_slice/stack_1zdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
?
ldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/stack/0Const*
dtype0*
_output_shapes
: *
value	B :
?
jdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/stackPackldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/stack/0rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/strided_slice*
T0*

axis *
N*
_output_shapes
:
?
idnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/TileTilendnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshape_1jdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/stack*

Tmultiples0*
T0
*0
_output_shapes
:??????????????????
?
odnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/zeros_like	ZerosLike|dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
?
ddnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weightsSelectidnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Tileodnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/zeros_like|dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
?
kdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Cast_1Cast_dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/dense_shape*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
:
?
rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_1/beginConst*
dtype0*
_output_shapes
:*
valueB: 
?
qdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_1/sizeConst*
dtype0*
_output_shapes
:*
valueB:
?
ldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_1Slicekdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Cast_1rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_1/beginqdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_1/size*
T0*
Index0*
_output_shapes
:
?
ldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Shape_1Shapeddnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights*
T0*
out_type0*
_output_shapes
:
?
rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:
?
qdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_2/sizeConst*
valueB:
?????????*
dtype0*
_output_shapes
:
?
ldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_2Sliceldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Shape_1rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_2/beginqdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_2/size*
T0*
Index0*
_output_shapes
:
?
pdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
kdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/concatConcatV2ldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_1ldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_2pdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
?
ndnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshape_2Reshapeddnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weightskdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/concat*'
_output_shapes
:?????????*
T0*
Tshape0
?
Idnn/input_from_feature_columns/input_layer/mother_married_embedding/ShapeShapendnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshape_2*
T0*
out_type0*
_output_shapes
:
?
Wdnn/input_from_feature_columns/input_layer/mother_married_embedding/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
?
Ydnn/input_from_feature_columns/input_layer/mother_married_embedding/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
?
Ydnn/input_from_feature_columns/input_layer/mother_married_embedding/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
Qdnn/input_from_feature_columns/input_layer/mother_married_embedding/strided_sliceStridedSliceIdnn/input_from_feature_columns/input_layer/mother_married_embedding/ShapeWdnn/input_from_feature_columns/input_layer/mother_married_embedding/strided_slice/stackYdnn/input_from_feature_columns/input_layer/mother_married_embedding/strided_slice/stack_1Ydnn/input_from_feature_columns/input_layer/mother_married_embedding/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
?
Sdnn/input_from_feature_columns/input_layer/mother_married_embedding/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
?
Qdnn/input_from_feature_columns/input_layer/mother_married_embedding/Reshape/shapePackQdnn/input_from_feature_columns/input_layer/mother_married_embedding/strided_sliceSdnn/input_from_feature_columns/input_layer/mother_married_embedding/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:
?
Kdnn/input_from_feature_columns/input_layer/mother_married_embedding/ReshapeReshapendnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshape_2Qdnn/input_from_feature_columns/input_layer/mother_married_embedding/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:?????????
?
Odnn/input_from_feature_columns/input_layer/mother_race_embedding/ExpandDims/dimConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
?
Kdnn/input_from_feature_columns/input_layer/mother_race_embedding/ExpandDims
ExpandDimsIteratorGetNext:7Odnn/input_from_feature_columns/input_layer/mother_race_embedding/ExpandDims/dim*

Tdim0*
T0*'
_output_shapes
:?????????
?
_dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/ignore_value/xConst*
dtype0*
_output_shapes
: *
valueB B 
?
Ydnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/NotEqualNotEqualKdnn/input_from_feature_columns/input_layer/mother_race_embedding/ExpandDims_dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/ignore_value/x*
T0*'
_output_shapes
:?????????
?
Xdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/indicesWhereYdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/NotEqual*'
_output_shapes
:?????????*
T0

?
Wdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/valuesGatherNdKdnn/input_from_feature_columns/input_layer/mother_race_embedding/ExpandDimsXdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/indices*
Tindices0	*
Tparams0*#
_output_shapes
:?????????
?
\dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/dense_shapeShapeKdnn/input_from_feature_columns/input_layer/mother_race_embedding/ExpandDims*
T0*
out_type0	*
_output_shapes
:
?
Ydnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/ConstConst*
dtype0*
_output_shapes
:*?
value?B?BWhiteBBlackBAmerican IndianBChineseBJapaneseBHawaiianBFilipinoBUnknownBAsian IndianBKoreanBSamaonB
Vietnamese
?
Xdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/SizeConst*
value	B :*
dtype0*
_output_shapes
: 
?
_dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
?
_dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
Ydnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/rangeRange_dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range/startXdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/Size_dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range/delta*
_output_shapes
:*

Tidx0
?
[dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/ToInt64CastYdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
:
?
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_table/ConstConst*
valueB	 R
?????????*
dtype0	*
_output_shapes
: 
?
^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_tableHashTableV2*
shared_name *
use_node_name_sharing( *
	key_dtype0*
	container *
value_dtype0	*
_output_shapes
: 
?
idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_table/table_initLookupTableImportV2^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_tableYdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/Const[dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/ToInt64*	
Tin0*

Tout0	
?
Rdnn/input_from_feature_columns/input_layer/mother_race_embedding/hash_table_LookupLookupTableFindV2^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_tableWdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/valuesddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_table/Const*	
Tin0*#
_output_shapes
:?????????*

Tout0	
?
jdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:
?
idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
?
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SliceSlice\dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/dense_shapejdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice/beginidnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice/size*
T0	*
Index0*
_output_shapes
:
?
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/ConstConst*
valueB: *
dtype0*
_output_shapes
:
?
cdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/ProdProdddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Sliceddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Const*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0	
?
odnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2/indicesConst*
value	B :*
dtype0*
_output_shapes
: 
?
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
?
gdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2GatherV2\dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/dense_shapeodnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2/indicesldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2/axis*
Tparams0	*
_output_shapes
: *
Taxis0*
Tindices0
?
ednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Cast/xPackcdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Prodgdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2*
N*
_output_shapes
:*
T0	*

axis 
?
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshapeSparseReshapeXdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/indices\dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/dense_shapeednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Cast/x*-
_output_shapes
:?????????:
?
udnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshape/IdentityIdentityRdnn/input_from_feature_columns/input_layer/mother_race_embedding/hash_table_Lookup*#
_output_shapes
:?????????*
T0	
?
mdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
?
kdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GreaterEqualGreaterEqualudnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshape/Identitymdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GreaterEqual/y*
T0	*#
_output_shapes
:?????????
?
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/WhereWherekdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GreaterEqual*
T0
*'
_output_shapes
:?????????
?
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape/shapeConst*
valueB:
?????????*
dtype0*
_output_shapes
:
?
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/ReshapeReshapeddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Whereldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape/shape*#
_output_shapes
:?????????*
T0	*
Tshape0
?
ndnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2_1GatherV2ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshapefdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshapendnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2_1/axis*'
_output_shapes
:?????????*
Taxis0*
Tindices0	*
Tparams0	
?
ndnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2_2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
?
idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2_2GatherV2udnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshape/Identityfdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshapendnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2_2/axis*
Tparams0	*#
_output_shapes
:?????????*
Taxis0*
Tindices0	
?
gdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/IdentityIdentityndnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshape:1*
_output_shapes
:*
T0	
?
xdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRowsidnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2_1idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2_2gdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Identityxdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/Const*T
_output_shapesB
@:?????????:?????????:?????????:?????????*
T0	
?
?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
?
?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlice?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stack?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*#
_output_shapes
:?????????*
Index0*
T0	
?
{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/CastCast?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*
Truncate( *

DstT0*#
_output_shapes
:?????????
?
}dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/UniqueUnique?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*
out_idx0*2
_output_shapes 
:?????????:?????????
?
?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/embedding_lookup/axisConst*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
value	B : *
dtype0*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/embedding_lookupGatherV2^dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/read}dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/Unique?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/embedding_lookup/axis*
Taxis0*
Tindices0	*
Tparams0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*'
_output_shapes
:?????????
?
?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentity?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:?????????
?
vdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparseSparseSegmentMean?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identitydnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/Unique:1{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/Cast*'
_output_shapes
:?????????*

Tidx0*
T0
?
ndnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_1/shapeConst*
valueB"????   *
dtype0*
_output_shapes
:
?
hdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_1Reshape?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:2ndnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:?????????
?
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/ShapeShapevdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
?
rdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
?
tdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
tdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_sliceStridedSliceddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Shaperdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stacktdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stack_1tdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
?
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
?
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/stackPackfdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/stack/0ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice*
T0*

axis *
N*
_output_shapes
:
?
cdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/TileTilehdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_1ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/stack*
T0
*0
_output_shapes
:??????????????????*

Tmultiples0
?
idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/zeros_like	ZerosLikevdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
?
^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weightsSelectcdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Tileidnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/zeros_likevdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:?????????
?
ednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Cast_1Cast\dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/dense_shape*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
:
?
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:
?
kdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
?
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1Sliceednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Cast_1ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1/beginkdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1/size*
_output_shapes
:*
T0*
Index0
?
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Shape_1Shape^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights*
_output_shapes
:*
T0*
out_type0
?
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:
?
kdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2/sizeConst*
valueB:
?????????*
dtype0*
_output_shapes
:
?
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2Slicefdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Shape_1ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2/beginkdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2/size*
_output_shapes
:*
T0*
Index0
?
jdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
ednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/concatConcatV2fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2jdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
?
hdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_2Reshape^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weightsednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/concat*
T0*
Tshape0*'
_output_shapes
:?????????
?
Fdnn/input_from_feature_columns/input_layer/mother_race_embedding/ShapeShapehdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_2*
T0*
out_type0*
_output_shapes
:
?
Tdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
?
Vdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
Vdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
Ndnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_sliceStridedSliceFdnn/input_from_feature_columns/input_layer/mother_race_embedding/ShapeTdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stackVdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stack_1Vdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stack_2*
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask 
?
Pdnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
?
Ndnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape/shapePackNdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slicePdnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:
?
Hdnn/input_from_feature_columns/input_layer/mother_race_embedding/ReshapeReshapehdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_2Ndnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:?????????
?
Cdnn/input_from_feature_columns/input_layer/plurality/ExpandDims/dimConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/plurality/ExpandDims
ExpandDimsIteratorGetNext:8Cdnn/input_from_feature_columns/input_layer/plurality/ExpandDims/dim*

Tdim0*
T0*'
_output_shapes
:?????????
?
:dnn/input_from_feature_columns/input_layer/plurality/ShapeShape?dnn/input_from_feature_columns/input_layer/plurality/ExpandDims*
T0*
out_type0*
_output_shapes
:
?
Hdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
?
Jdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
Jdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
Bdnn/input_from_feature_columns/input_layer/plurality/strided_sliceStridedSlice:dnn/input_from_feature_columns/input_layer/plurality/ShapeHdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stackJdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stack_1Jdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
?
Ddnn/input_from_feature_columns/input_layer/plurality/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
?
Bdnn/input_from_feature_columns/input_layer/plurality/Reshape/shapePackBdnn/input_from_feature_columns/input_layer/plurality/strided_sliceDdnn/input_from_feature_columns/input_layer/plurality/Reshape/shape/1*
N*
_output_shapes
:*
T0*

axis 
?
<dnn/input_from_feature_columns/input_layer/plurality/ReshapeReshape?dnn/input_from_feature_columns/input_layer/plurality/ExpandDimsBdnn/input_from_feature_columns/input_layer/plurality/Reshape/shape*
T0*
Tshape0*'
_output_shapes
:?????????
x
6dnn/input_from_feature_columns/input_layer/concat/axisConst*
value	B :*
dtype0*
_output_shapes
: 
?
1dnn/input_from_feature_columns/input_layer/concatConcatV2Hdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/ReshapeJdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/ReshapeBdnn/input_from_feature_columns/input_layer/gestation_weeks/ReshapeDdnn/input_from_feature_columns/input_layer/is_male_embedding/Reshape=dnn/input_from_feature_columns/input_layer/mother_age/ReshapeKdnn/input_from_feature_columns/input_layer/mother_married_embedding/ReshapeHdnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape<dnn/input_from_feature_columns/input_layer/plurality/Reshape6dnn/input_from_feature_columns/input_layer/concat/axis*
T0*
N*'
_output_shapes
:?????????*

Tidx0
?
@dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/shapeConst*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
valueB"       *
dtype0*
_output_shapes
:
?
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/minConst*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
valueB
 *Xﶾ*
dtype0*
_output_shapes
: 
?
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/maxConst*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
valueB
 *X??>*
dtype0*
_output_shapes
: 
?
Hdnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/shape*
dtype0*
_output_shapes

: *
seedޱ?	*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
seed2?
?
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
_output_shapes
: 
?
>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/sub*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
_output_shapes

: 
?
:dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
_output_shapes

: 
?
dnn/hiddenlayer_0/kernel/part_0VarHandleOp*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
	container *
shape
: *
dtype0*
_output_shapes
: *0
shared_name!dnn/hiddenlayer_0/kernel/part_0
?
@dnn/hiddenlayer_0/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_0/kernel/part_0*
_output_shapes
: 
?
&dnn/hiddenlayer_0/kernel/part_0/AssignAssignVariableOpdnn/hiddenlayer_0/kernel/part_0:dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0
?
3dnn/hiddenlayer_0/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes

: 
?
/dnn/hiddenlayer_0/bias/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
: *0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
valueB *    
?
dnn/hiddenlayer_0/bias/part_0VarHandleOp*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
	container *
shape: *
dtype0*
_output_shapes
: *.
shared_namednn/hiddenlayer_0/bias/part_0
?
>dnn/hiddenlayer_0/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_0/bias/part_0*
_output_shapes
: 
?
$dnn/hiddenlayer_0/bias/part_0/AssignAssignVariableOpdnn/hiddenlayer_0/bias/part_0/dnn/hiddenlayer_0/bias/part_0/Initializer/zeros*
dtype0*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0
?
1dnn/hiddenlayer_0/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes
: *0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0
?
'dnn/hiddenlayer_0/kernel/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes

: 
v
dnn/hiddenlayer_0/kernelIdentity'dnn/hiddenlayer_0/kernel/ReadVariableOp*
T0*
_output_shapes

: 
?
dnn/hiddenlayer_0/MatMulMatMul1dnn/input_from_feature_columns/input_layer/concatdnn/hiddenlayer_0/kernel*
transpose_a( *'
_output_shapes
:????????? *
transpose_b( *
T0

%dnn/hiddenlayer_0/bias/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes
: 
n
dnn/hiddenlayer_0/biasIdentity%dnn/hiddenlayer_0/bias/ReadVariableOp*
T0*
_output_shapes
: 
?
dnn/hiddenlayer_0/BiasAddBiasAdddnn/hiddenlayer_0/MatMuldnn/hiddenlayer_0/bias*
T0*
data_formatNHWC*'
_output_shapes
:????????? 
k
dnn/hiddenlayer_0/ReluReludnn/hiddenlayer_0/BiasAdd*
T0*'
_output_shapes
:????????? 
?
;dnn/hiddenlayer_0/batchnorm_0/gamma/part_0/Initializer/onesConst*
dtype0*
_output_shapes
: *=
_class3
1/loc:@dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*
valueB *  ??
?
*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0VarHandleOp*
shape: *
dtype0*
_output_shapes
: *;
shared_name,*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*=
_class3
1/loc:@dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*
	container 
?
Kdnn/hiddenlayer_0/batchnorm_0/gamma/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*
_output_shapes
: 
?
1dnn/hiddenlayer_0/batchnorm_0/gamma/part_0/AssignAssignVariableOp*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0;dnn/hiddenlayer_0/batchnorm_0/gamma/part_0/Initializer/ones*
dtype0*=
_class3
1/loc:@dnn/hiddenlayer_0/batchnorm_0/gamma/part_0
?
>dnn/hiddenlayer_0/batchnorm_0/gamma/part_0/Read/ReadVariableOpReadVariableOp*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*=
_class3
1/loc:@dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*
dtype0*
_output_shapes
: 
?
;dnn/hiddenlayer_0/batchnorm_0/beta/part_0/Initializer/zerosConst*<
_class2
0.loc:@dnn/hiddenlayer_0/batchnorm_0/beta/part_0*
valueB *    *
dtype0*
_output_shapes
: 
?
)dnn/hiddenlayer_0/batchnorm_0/beta/part_0VarHandleOp*:
shared_name+)dnn/hiddenlayer_0/batchnorm_0/beta/part_0*<
_class2
0.loc:@dnn/hiddenlayer_0/batchnorm_0/beta/part_0*
	container *
shape: *
dtype0*
_output_shapes
: 
?
Jdnn/hiddenlayer_0/batchnorm_0/beta/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp)dnn/hiddenlayer_0/batchnorm_0/beta/part_0*
_output_shapes
: 
?
0dnn/hiddenlayer_0/batchnorm_0/beta/part_0/AssignAssignVariableOp)dnn/hiddenlayer_0/batchnorm_0/beta/part_0;dnn/hiddenlayer_0/batchnorm_0/beta/part_0/Initializer/zeros*<
_class2
0.loc:@dnn/hiddenlayer_0/batchnorm_0/beta/part_0*
dtype0
?
=dnn/hiddenlayer_0/batchnorm_0/beta/part_0/Read/ReadVariableOpReadVariableOp)dnn/hiddenlayer_0/batchnorm_0/beta/part_0*<
_class2
0.loc:@dnn/hiddenlayer_0/batchnorm_0/beta/part_0*
dtype0*
_output_shapes
: 
?
;dnn/hiddenlayer_0/batchnorm_0/moving_mean/Initializer/zerosConst*<
_class2
0.loc:@dnn/hiddenlayer_0/batchnorm_0/moving_mean*
valueB *    *
dtype0*
_output_shapes
: 
?
)dnn/hiddenlayer_0/batchnorm_0/moving_meanVarHandleOp*
dtype0*
_output_shapes
: *:
shared_name+)dnn/hiddenlayer_0/batchnorm_0/moving_mean*<
_class2
0.loc:@dnn/hiddenlayer_0/batchnorm_0/moving_mean*
	container *
shape: 
?
Jdnn/hiddenlayer_0/batchnorm_0/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp)dnn/hiddenlayer_0/batchnorm_0/moving_mean*
_output_shapes
: 
?
0dnn/hiddenlayer_0/batchnorm_0/moving_mean/AssignAssignVariableOp)dnn/hiddenlayer_0/batchnorm_0/moving_mean;dnn/hiddenlayer_0/batchnorm_0/moving_mean/Initializer/zeros*<
_class2
0.loc:@dnn/hiddenlayer_0/batchnorm_0/moving_mean*
dtype0
?
=dnn/hiddenlayer_0/batchnorm_0/moving_mean/Read/ReadVariableOpReadVariableOp)dnn/hiddenlayer_0/batchnorm_0/moving_mean*<
_class2
0.loc:@dnn/hiddenlayer_0/batchnorm_0/moving_mean*
dtype0*
_output_shapes
: 
?
>dnn/hiddenlayer_0/batchnorm_0/moving_variance/Initializer/onesConst*@
_class6
42loc:@dnn/hiddenlayer_0/batchnorm_0/moving_variance*
valueB *  ??*
dtype0*
_output_shapes
: 
?
-dnn/hiddenlayer_0/batchnorm_0/moving_varianceVarHandleOp*>
shared_name/-dnn/hiddenlayer_0/batchnorm_0/moving_variance*@
_class6
42loc:@dnn/hiddenlayer_0/batchnorm_0/moving_variance*
	container *
shape: *
dtype0*
_output_shapes
: 
?
Ndnn/hiddenlayer_0/batchnorm_0/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp-dnn/hiddenlayer_0/batchnorm_0/moving_variance*
_output_shapes
: 
?
4dnn/hiddenlayer_0/batchnorm_0/moving_variance/AssignAssignVariableOp-dnn/hiddenlayer_0/batchnorm_0/moving_variance>dnn/hiddenlayer_0/batchnorm_0/moving_variance/Initializer/ones*@
_class6
42loc:@dnn/hiddenlayer_0/batchnorm_0/moving_variance*
dtype0
?
Adnn/hiddenlayer_0/batchnorm_0/moving_variance/Read/ReadVariableOpReadVariableOp-dnn/hiddenlayer_0/batchnorm_0/moving_variance*
dtype0*
_output_shapes
: *@
_class6
42loc:@dnn/hiddenlayer_0/batchnorm_0/moving_variance
?
1dnn/hiddenlayer_0/batchnorm_0/beta/ReadVariableOpReadVariableOp)dnn/hiddenlayer_0/batchnorm_0/beta/part_0*
dtype0*
_output_shapes
: 
?
"dnn/hiddenlayer_0/batchnorm_0/betaIdentity1dnn/hiddenlayer_0/batchnorm_0/beta/ReadVariableOp*
_output_shapes
: *
T0
?
6dnn/hiddenlayer_0/batchnorm_0/batchnorm/ReadVariableOpReadVariableOp-dnn/hiddenlayer_0/batchnorm_0/moving_variance*
dtype0*
_output_shapes
: 
r
-dnn/hiddenlayer_0/batchnorm_0/batchnorm/add/yConst*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
+dnn/hiddenlayer_0/batchnorm_0/batchnorm/addAdd6dnn/hiddenlayer_0/batchnorm_0/batchnorm/ReadVariableOp-dnn/hiddenlayer_0/batchnorm_0/batchnorm/add/y*
T0*
_output_shapes
: 
?
-dnn/hiddenlayer_0/batchnorm_0/batchnorm/RsqrtRsqrt+dnn/hiddenlayer_0/batchnorm_0/batchnorm/add*
T0*
_output_shapes
: 
?
2dnn/hiddenlayer_0/batchnorm_0/gamma/ReadVariableOpReadVariableOp*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*
dtype0*
_output_shapes
: 
?
#dnn/hiddenlayer_0/batchnorm_0/gammaIdentity2dnn/hiddenlayer_0/batchnorm_0/gamma/ReadVariableOp*
T0*
_output_shapes
: 
?
+dnn/hiddenlayer_0/batchnorm_0/batchnorm/mulMul-dnn/hiddenlayer_0/batchnorm_0/batchnorm/Rsqrt#dnn/hiddenlayer_0/batchnorm_0/gamma*
_output_shapes
: *
T0
?
-dnn/hiddenlayer_0/batchnorm_0/batchnorm/mul_1Muldnn/hiddenlayer_0/Relu+dnn/hiddenlayer_0/batchnorm_0/batchnorm/mul*'
_output_shapes
:????????? *
T0
?
8dnn/hiddenlayer_0/batchnorm_0/batchnorm/ReadVariableOp_1ReadVariableOp)dnn/hiddenlayer_0/batchnorm_0/moving_mean*
dtype0*
_output_shapes
: 
?
-dnn/hiddenlayer_0/batchnorm_0/batchnorm/mul_2Mul8dnn/hiddenlayer_0/batchnorm_0/batchnorm/ReadVariableOp_1+dnn/hiddenlayer_0/batchnorm_0/batchnorm/mul*
_output_shapes
: *
T0
?
+dnn/hiddenlayer_0/batchnorm_0/batchnorm/subSub"dnn/hiddenlayer_0/batchnorm_0/beta-dnn/hiddenlayer_0/batchnorm_0/batchnorm/mul_2*
_output_shapes
: *
T0
?
-dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1Add-dnn/hiddenlayer_0/batchnorm_0/batchnorm/mul_1+dnn/hiddenlayer_0/batchnorm_0/batchnorm/sub*
T0*'
_output_shapes
:????????? 
~
dnn/zero_fraction/SizeSize-dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1*
T0*
out_type0	*
_output_shapes
: 
c
dnn/zero_fraction/LessEqual/yConst*
valueB	 R????*
dtype0	*
_output_shapes
: 
?
dnn/zero_fraction/LessEqual	LessEqualdnn/zero_fraction/Sizednn/zero_fraction/LessEqual/y*
T0	*
_output_shapes
: 
?
dnn/zero_fraction/cond/SwitchSwitchdnn/zero_fraction/LessEqualdnn/zero_fraction/LessEqual*
T0
*
_output_shapes
: : 
m
dnn/zero_fraction/cond/switch_tIdentitydnn/zero_fraction/cond/Switch:1*
T0
*
_output_shapes
: 
k
dnn/zero_fraction/cond/switch_fIdentitydnn/zero_fraction/cond/Switch*
_output_shapes
: *
T0

h
dnn/zero_fraction/cond/pred_idIdentitydnn/zero_fraction/LessEqual*
T0
*
_output_shapes
: 
?
*dnn/zero_fraction/cond/count_nonzero/zerosConst ^dnn/zero_fraction/cond/switch_t*
valueB
 *    *
dtype0*
_output_shapes
: 
?
-dnn/zero_fraction/cond/count_nonzero/NotEqualNotEqual6dnn/zero_fraction/cond/count_nonzero/NotEqual/Switch:1*dnn/zero_fraction/cond/count_nonzero/zeros*'
_output_shapes
:????????? *
T0
?
4dnn/zero_fraction/cond/count_nonzero/NotEqual/SwitchSwitch-dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1dnn/zero_fraction/cond/pred_id*
T0*@
_class6
42loc:@dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1*:
_output_shapes(
&:????????? :????????? 
?
)dnn/zero_fraction/cond/count_nonzero/CastCast-dnn/zero_fraction/cond/count_nonzero/NotEqual*

SrcT0
*
Truncate( *

DstT0*'
_output_shapes
:????????? 
?
*dnn/zero_fraction/cond/count_nonzero/ConstConst ^dnn/zero_fraction/cond/switch_t*
valueB"       *
dtype0*
_output_shapes
:
?
2dnn/zero_fraction/cond/count_nonzero/nonzero_countSum)dnn/zero_fraction/cond/count_nonzero/Cast*dnn/zero_fraction/cond/count_nonzero/Const*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 
?
dnn/zero_fraction/cond/CastCast2dnn/zero_fraction/cond/count_nonzero/nonzero_count*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 
?
,dnn/zero_fraction/cond/count_nonzero_1/zerosConst ^dnn/zero_fraction/cond/switch_f*
valueB
 *    *
dtype0*
_output_shapes
: 
?
/dnn/zero_fraction/cond/count_nonzero_1/NotEqualNotEqual6dnn/zero_fraction/cond/count_nonzero_1/NotEqual/Switch,dnn/zero_fraction/cond/count_nonzero_1/zeros*
T0*'
_output_shapes
:????????? 
?
6dnn/zero_fraction/cond/count_nonzero_1/NotEqual/SwitchSwitch-dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1dnn/zero_fraction/cond/pred_id*:
_output_shapes(
&:????????? :????????? *
T0*@
_class6
42loc:@dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1
?
+dnn/zero_fraction/cond/count_nonzero_1/CastCast/dnn/zero_fraction/cond/count_nonzero_1/NotEqual*

SrcT0
*
Truncate( *

DstT0	*'
_output_shapes
:????????? 
?
,dnn/zero_fraction/cond/count_nonzero_1/ConstConst ^dnn/zero_fraction/cond/switch_f*
valueB"       *
dtype0*
_output_shapes
:
?
4dnn/zero_fraction/cond/count_nonzero_1/nonzero_countSum+dnn/zero_fraction/cond/count_nonzero_1/Cast,dnn/zero_fraction/cond/count_nonzero_1/Const*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0	
?
dnn/zero_fraction/cond/MergeMerge4dnn/zero_fraction/cond/count_nonzero_1/nonzero_countdnn/zero_fraction/cond/Cast*
T0	*
N*
_output_shapes
: : 
?
(dnn/zero_fraction/counts_to_fraction/subSubdnn/zero_fraction/Sizednn/zero_fraction/cond/Merge*
_output_shapes
: *
T0	
?
)dnn/zero_fraction/counts_to_fraction/CastCast(dnn/zero_fraction/counts_to_fraction/sub*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
: 
?
+dnn/zero_fraction/counts_to_fraction/Cast_1Castdnn/zero_fraction/Size*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
: 
?
,dnn/zero_fraction/counts_to_fraction/truedivRealDiv)dnn/zero_fraction/counts_to_fraction/Cast+dnn/zero_fraction/counts_to_fraction/Cast_1*
T0*
_output_shapes
: 
u
dnn/zero_fraction/fractionIdentity,dnn/zero_fraction/counts_to_fraction/truediv*
T0*
_output_shapes
: 
?
2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsConst*>
value5B3 B-dnn/dnn/hiddenlayer_0/fraction_of_zero_values*
dtype0*
_output_shapes
: 
?
-dnn/dnn/hiddenlayer_0/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsdnn/zero_fraction/fraction*
T0*
_output_shapes
: 
?
$dnn/dnn/hiddenlayer_0/activation/tagConst*1
value(B& B dnn/dnn/hiddenlayer_0/activation*
dtype0*
_output_shapes
: 
?
 dnn/dnn/hiddenlayer_0/activationHistogramSummary$dnn/dnn/hiddenlayer_0/activation/tag-dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1*
T0*
_output_shapes
: 
?
@dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
valueB"       
?
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/minConst*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
valueB
 *????*
dtype0*
_output_shapes
: 
?
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/maxConst*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
valueB
 *???>*
dtype0*
_output_shapes
: 
?
Hdnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/shape*
dtype0*
_output_shapes

: *
seedޱ?	*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
seed2?
?
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/min*
_output_shapes
: *
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0
?
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/sub*
_output_shapes

: *
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0
?
:dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
_output_shapes

: 
?
dnn/hiddenlayer_1/kernel/part_0VarHandleOp*0
shared_name!dnn/hiddenlayer_1/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
	container *
shape
: *
dtype0*
_output_shapes
: 
?
@dnn/hiddenlayer_1/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_1/kernel/part_0*
_output_shapes
: 
?
&dnn/hiddenlayer_1/kernel/part_0/AssignAssignVariableOpdnn/hiddenlayer_1/kernel/part_0:dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0
?
3dnn/hiddenlayer_1/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes

: *2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0
?
/dnn/hiddenlayer_1/bias/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
valueB*    
?
dnn/hiddenlayer_1/bias/part_0VarHandleOp*
dtype0*
_output_shapes
: *.
shared_namednn/hiddenlayer_1/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
	container *
shape:
?
>dnn/hiddenlayer_1/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_1/bias/part_0*
_output_shapes
: 
?
$dnn/hiddenlayer_1/bias/part_0/AssignAssignVariableOpdnn/hiddenlayer_1/bias/part_0/dnn/hiddenlayer_1/bias/part_0/Initializer/zeros*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
dtype0
?
1dnn/hiddenlayer_1/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
dtype0*
_output_shapes
:
?
'dnn/hiddenlayer_1/kernel/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes

: 
v
dnn/hiddenlayer_1/kernelIdentity'dnn/hiddenlayer_1/kernel/ReadVariableOp*
T0*
_output_shapes

: 
?
dnn/hiddenlayer_1/MatMulMatMul-dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1dnn/hiddenlayer_1/kernel*
transpose_a( *'
_output_shapes
:?????????*
transpose_b( *
T0

%dnn/hiddenlayer_1/bias/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0*
dtype0*
_output_shapes
:
n
dnn/hiddenlayer_1/biasIdentity%dnn/hiddenlayer_1/bias/ReadVariableOp*
T0*
_output_shapes
:
?
dnn/hiddenlayer_1/BiasAddBiasAdddnn/hiddenlayer_1/MatMuldnn/hiddenlayer_1/bias*
T0*
data_formatNHWC*'
_output_shapes
:?????????
k
dnn/hiddenlayer_1/ReluReludnn/hiddenlayer_1/BiasAdd*
T0*'
_output_shapes
:?????????
?
;dnn/hiddenlayer_1/batchnorm_1/gamma/part_0/Initializer/onesConst*=
_class3
1/loc:@dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*
valueB*  ??*
dtype0*
_output_shapes
:
?
*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0VarHandleOp*;
shared_name,*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*=
_class3
1/loc:@dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*
	container *
shape:*
dtype0*
_output_shapes
: 
?
Kdnn/hiddenlayer_1/batchnorm_1/gamma/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*
_output_shapes
: 
?
1dnn/hiddenlayer_1/batchnorm_1/gamma/part_0/AssignAssignVariableOp*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0;dnn/hiddenlayer_1/batchnorm_1/gamma/part_0/Initializer/ones*=
_class3
1/loc:@dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*
dtype0
?
>dnn/hiddenlayer_1/batchnorm_1/gamma/part_0/Read/ReadVariableOpReadVariableOp*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*=
_class3
1/loc:@dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*
dtype0*
_output_shapes
:
?
;dnn/hiddenlayer_1/batchnorm_1/beta/part_0/Initializer/zerosConst*<
_class2
0.loc:@dnn/hiddenlayer_1/batchnorm_1/beta/part_0*
valueB*    *
dtype0*
_output_shapes
:
?
)dnn/hiddenlayer_1/batchnorm_1/beta/part_0VarHandleOp*:
shared_name+)dnn/hiddenlayer_1/batchnorm_1/beta/part_0*<
_class2
0.loc:@dnn/hiddenlayer_1/batchnorm_1/beta/part_0*
	container *
shape:*
dtype0*
_output_shapes
: 
?
Jdnn/hiddenlayer_1/batchnorm_1/beta/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp)dnn/hiddenlayer_1/batchnorm_1/beta/part_0*
_output_shapes
: 
?
0dnn/hiddenlayer_1/batchnorm_1/beta/part_0/AssignAssignVariableOp)dnn/hiddenlayer_1/batchnorm_1/beta/part_0;dnn/hiddenlayer_1/batchnorm_1/beta/part_0/Initializer/zeros*
dtype0*<
_class2
0.loc:@dnn/hiddenlayer_1/batchnorm_1/beta/part_0
?
=dnn/hiddenlayer_1/batchnorm_1/beta/part_0/Read/ReadVariableOpReadVariableOp)dnn/hiddenlayer_1/batchnorm_1/beta/part_0*
dtype0*
_output_shapes
:*<
_class2
0.loc:@dnn/hiddenlayer_1/batchnorm_1/beta/part_0
?
;dnn/hiddenlayer_1/batchnorm_1/moving_mean/Initializer/zerosConst*<
_class2
0.loc:@dnn/hiddenlayer_1/batchnorm_1/moving_mean*
valueB*    *
dtype0*
_output_shapes
:
?
)dnn/hiddenlayer_1/batchnorm_1/moving_meanVarHandleOp*:
shared_name+)dnn/hiddenlayer_1/batchnorm_1/moving_mean*<
_class2
0.loc:@dnn/hiddenlayer_1/batchnorm_1/moving_mean*
	container *
shape:*
dtype0*
_output_shapes
: 
?
Jdnn/hiddenlayer_1/batchnorm_1/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp)dnn/hiddenlayer_1/batchnorm_1/moving_mean*
_output_shapes
: 
?
0dnn/hiddenlayer_1/batchnorm_1/moving_mean/AssignAssignVariableOp)dnn/hiddenlayer_1/batchnorm_1/moving_mean;dnn/hiddenlayer_1/batchnorm_1/moving_mean/Initializer/zeros*<
_class2
0.loc:@dnn/hiddenlayer_1/batchnorm_1/moving_mean*
dtype0
?
=dnn/hiddenlayer_1/batchnorm_1/moving_mean/Read/ReadVariableOpReadVariableOp)dnn/hiddenlayer_1/batchnorm_1/moving_mean*<
_class2
0.loc:@dnn/hiddenlayer_1/batchnorm_1/moving_mean*
dtype0*
_output_shapes
:
?
>dnn/hiddenlayer_1/batchnorm_1/moving_variance/Initializer/onesConst*
dtype0*
_output_shapes
:*@
_class6
42loc:@dnn/hiddenlayer_1/batchnorm_1/moving_variance*
valueB*  ??
?
-dnn/hiddenlayer_1/batchnorm_1/moving_varianceVarHandleOp*
dtype0*
_output_shapes
: *>
shared_name/-dnn/hiddenlayer_1/batchnorm_1/moving_variance*@
_class6
42loc:@dnn/hiddenlayer_1/batchnorm_1/moving_variance*
	container *
shape:
?
Ndnn/hiddenlayer_1/batchnorm_1/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp-dnn/hiddenlayer_1/batchnorm_1/moving_variance*
_output_shapes
: 
?
4dnn/hiddenlayer_1/batchnorm_1/moving_variance/AssignAssignVariableOp-dnn/hiddenlayer_1/batchnorm_1/moving_variance>dnn/hiddenlayer_1/batchnorm_1/moving_variance/Initializer/ones*@
_class6
42loc:@dnn/hiddenlayer_1/batchnorm_1/moving_variance*
dtype0
?
Adnn/hiddenlayer_1/batchnorm_1/moving_variance/Read/ReadVariableOpReadVariableOp-dnn/hiddenlayer_1/batchnorm_1/moving_variance*
dtype0*
_output_shapes
:*@
_class6
42loc:@dnn/hiddenlayer_1/batchnorm_1/moving_variance
?
1dnn/hiddenlayer_1/batchnorm_1/beta/ReadVariableOpReadVariableOp)dnn/hiddenlayer_1/batchnorm_1/beta/part_0*
dtype0*
_output_shapes
:
?
"dnn/hiddenlayer_1/batchnorm_1/betaIdentity1dnn/hiddenlayer_1/batchnorm_1/beta/ReadVariableOp*
T0*
_output_shapes
:
?
6dnn/hiddenlayer_1/batchnorm_1/batchnorm/ReadVariableOpReadVariableOp-dnn/hiddenlayer_1/batchnorm_1/moving_variance*
dtype0*
_output_shapes
:
r
-dnn/hiddenlayer_1/batchnorm_1/batchnorm/add/yConst*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
+dnn/hiddenlayer_1/batchnorm_1/batchnorm/addAdd6dnn/hiddenlayer_1/batchnorm_1/batchnorm/ReadVariableOp-dnn/hiddenlayer_1/batchnorm_1/batchnorm/add/y*
_output_shapes
:*
T0
?
-dnn/hiddenlayer_1/batchnorm_1/batchnorm/RsqrtRsqrt+dnn/hiddenlayer_1/batchnorm_1/batchnorm/add*
T0*
_output_shapes
:
?
2dnn/hiddenlayer_1/batchnorm_1/gamma/ReadVariableOpReadVariableOp*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*
dtype0*
_output_shapes
:
?
#dnn/hiddenlayer_1/batchnorm_1/gammaIdentity2dnn/hiddenlayer_1/batchnorm_1/gamma/ReadVariableOp*
T0*
_output_shapes
:
?
+dnn/hiddenlayer_1/batchnorm_1/batchnorm/mulMul-dnn/hiddenlayer_1/batchnorm_1/batchnorm/Rsqrt#dnn/hiddenlayer_1/batchnorm_1/gamma*
T0*
_output_shapes
:
?
-dnn/hiddenlayer_1/batchnorm_1/batchnorm/mul_1Muldnn/hiddenlayer_1/Relu+dnn/hiddenlayer_1/batchnorm_1/batchnorm/mul*'
_output_shapes
:?????????*
T0
?
8dnn/hiddenlayer_1/batchnorm_1/batchnorm/ReadVariableOp_1ReadVariableOp)dnn/hiddenlayer_1/batchnorm_1/moving_mean*
dtype0*
_output_shapes
:
?
-dnn/hiddenlayer_1/batchnorm_1/batchnorm/mul_2Mul8dnn/hiddenlayer_1/batchnorm_1/batchnorm/ReadVariableOp_1+dnn/hiddenlayer_1/batchnorm_1/batchnorm/mul*
T0*
_output_shapes
:
?
+dnn/hiddenlayer_1/batchnorm_1/batchnorm/subSub"dnn/hiddenlayer_1/batchnorm_1/beta-dnn/hiddenlayer_1/batchnorm_1/batchnorm/mul_2*
T0*
_output_shapes
:
?
-dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1Add-dnn/hiddenlayer_1/batchnorm_1/batchnorm/mul_1+dnn/hiddenlayer_1/batchnorm_1/batchnorm/sub*'
_output_shapes
:?????????*
T0
?
dnn/zero_fraction_1/SizeSize-dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1*
T0*
out_type0	*
_output_shapes
: 
e
dnn/zero_fraction_1/LessEqual/yConst*
valueB	 R????*
dtype0	*
_output_shapes
: 
?
dnn/zero_fraction_1/LessEqual	LessEqualdnn/zero_fraction_1/Sizednn/zero_fraction_1/LessEqual/y*
T0	*
_output_shapes
: 
?
dnn/zero_fraction_1/cond/SwitchSwitchdnn/zero_fraction_1/LessEqualdnn/zero_fraction_1/LessEqual*
T0
*
_output_shapes
: : 
q
!dnn/zero_fraction_1/cond/switch_tIdentity!dnn/zero_fraction_1/cond/Switch:1*
T0
*
_output_shapes
: 
o
!dnn/zero_fraction_1/cond/switch_fIdentitydnn/zero_fraction_1/cond/Switch*
_output_shapes
: *
T0

l
 dnn/zero_fraction_1/cond/pred_idIdentitydnn/zero_fraction_1/LessEqual*
T0
*
_output_shapes
: 
?
,dnn/zero_fraction_1/cond/count_nonzero/zerosConst"^dnn/zero_fraction_1/cond/switch_t*
dtype0*
_output_shapes
: *
valueB
 *    
?
/dnn/zero_fraction_1/cond/count_nonzero/NotEqualNotEqual8dnn/zero_fraction_1/cond/count_nonzero/NotEqual/Switch:1,dnn/zero_fraction_1/cond/count_nonzero/zeros*
T0*'
_output_shapes
:?????????
?
6dnn/zero_fraction_1/cond/count_nonzero/NotEqual/SwitchSwitch-dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1 dnn/zero_fraction_1/cond/pred_id*:
_output_shapes(
&:?????????:?????????*
T0*@
_class6
42loc:@dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1
?
+dnn/zero_fraction_1/cond/count_nonzero/CastCast/dnn/zero_fraction_1/cond/count_nonzero/NotEqual*

SrcT0
*
Truncate( *

DstT0*'
_output_shapes
:?????????
?
,dnn/zero_fraction_1/cond/count_nonzero/ConstConst"^dnn/zero_fraction_1/cond/switch_t*
valueB"       *
dtype0*
_output_shapes
:
?
4dnn/zero_fraction_1/cond/count_nonzero/nonzero_countSum+dnn/zero_fraction_1/cond/count_nonzero/Cast,dnn/zero_fraction_1/cond/count_nonzero/Const*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 
?
dnn/zero_fraction_1/cond/CastCast4dnn/zero_fraction_1/cond/count_nonzero/nonzero_count*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 
?
.dnn/zero_fraction_1/cond/count_nonzero_1/zerosConst"^dnn/zero_fraction_1/cond/switch_f*
dtype0*
_output_shapes
: *
valueB
 *    
?
1dnn/zero_fraction_1/cond/count_nonzero_1/NotEqualNotEqual8dnn/zero_fraction_1/cond/count_nonzero_1/NotEqual/Switch.dnn/zero_fraction_1/cond/count_nonzero_1/zeros*
T0*'
_output_shapes
:?????????
?
8dnn/zero_fraction_1/cond/count_nonzero_1/NotEqual/SwitchSwitch-dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1 dnn/zero_fraction_1/cond/pred_id*:
_output_shapes(
&:?????????:?????????*
T0*@
_class6
42loc:@dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1
?
-dnn/zero_fraction_1/cond/count_nonzero_1/CastCast1dnn/zero_fraction_1/cond/count_nonzero_1/NotEqual*

SrcT0
*
Truncate( *

DstT0	*'
_output_shapes
:?????????
?
.dnn/zero_fraction_1/cond/count_nonzero_1/ConstConst"^dnn/zero_fraction_1/cond/switch_f*
valueB"       *
dtype0*
_output_shapes
:
?
6dnn/zero_fraction_1/cond/count_nonzero_1/nonzero_countSum-dnn/zero_fraction_1/cond/count_nonzero_1/Cast.dnn/zero_fraction_1/cond/count_nonzero_1/Const*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0	
?
dnn/zero_fraction_1/cond/MergeMerge6dnn/zero_fraction_1/cond/count_nonzero_1/nonzero_countdnn/zero_fraction_1/cond/Cast*
T0	*
N*
_output_shapes
: : 
?
*dnn/zero_fraction_1/counts_to_fraction/subSubdnn/zero_fraction_1/Sizednn/zero_fraction_1/cond/Merge*
_output_shapes
: *
T0	
?
+dnn/zero_fraction_1/counts_to_fraction/CastCast*dnn/zero_fraction_1/counts_to_fraction/sub*
Truncate( *

DstT0*
_output_shapes
: *

SrcT0	
?
-dnn/zero_fraction_1/counts_to_fraction/Cast_1Castdnn/zero_fraction_1/Size*
Truncate( *

DstT0*
_output_shapes
: *

SrcT0	
?
.dnn/zero_fraction_1/counts_to_fraction/truedivRealDiv+dnn/zero_fraction_1/counts_to_fraction/Cast-dnn/zero_fraction_1/counts_to_fraction/Cast_1*
T0*
_output_shapes
: 
y
dnn/zero_fraction_1/fractionIdentity.dnn/zero_fraction_1/counts_to_fraction/truediv*
T0*
_output_shapes
: 
?
2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsConst*>
value5B3 B-dnn/dnn/hiddenlayer_1/fraction_of_zero_values*
dtype0*
_output_shapes
: 
?
-dnn/dnn/hiddenlayer_1/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_1/fraction_of_zero_values/tagsdnn/zero_fraction_1/fraction*
T0*
_output_shapes
: 
?
$dnn/dnn/hiddenlayer_1/activation/tagConst*
dtype0*
_output_shapes
: *1
value(B& B dnn/dnn/hiddenlayer_1/activation
?
 dnn/dnn/hiddenlayer_1/activationHistogramSummary$dnn/dnn/hiddenlayer_1/activation/tag-dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1*
T0*
_output_shapes
: 
?
@dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
valueB"      
?
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/minConst*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
valueB
 *?-ξ*
dtype0*
_output_shapes
: 
?
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/maxConst*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
valueB
 *?-?>*
dtype0*
_output_shapes
: 
?
Hdnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/shape*
dtype0*
_output_shapes

:*
seedޱ?	*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
seed2?
?
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
_output_shapes
: 
?
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/sub*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
_output_shapes

:
?
:dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
_output_shapes

:
?
dnn/hiddenlayer_2/kernel/part_0VarHandleOp*
dtype0*
_output_shapes
: *0
shared_name!dnn/hiddenlayer_2/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
	container *
shape
:
?
@dnn/hiddenlayer_2/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_2/kernel/part_0*
_output_shapes
: 
?
&dnn/hiddenlayer_2/kernel/part_0/AssignAssignVariableOpdnn/hiddenlayer_2/kernel/part_0:dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform*
dtype0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0
?
3dnn/hiddenlayer_2/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes

:
?
/dnn/hiddenlayer_2/bias/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
valueB*    
?
dnn/hiddenlayer_2/bias/part_0VarHandleOp*.
shared_namednn/hiddenlayer_2/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
	container *
shape:*
dtype0*
_output_shapes
: 
?
>dnn/hiddenlayer_2/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_2/bias/part_0*
_output_shapes
: 
?
$dnn/hiddenlayer_2/bias/part_0/AssignAssignVariableOpdnn/hiddenlayer_2/bias/part_0/dnn/hiddenlayer_2/bias/part_0/Initializer/zeros*
dtype0*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0
?
1dnn/hiddenlayer_2/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
dtype0*
_output_shapes
:
?
'dnn/hiddenlayer_2/kernel/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes

:
v
dnn/hiddenlayer_2/kernelIdentity'dnn/hiddenlayer_2/kernel/ReadVariableOp*
_output_shapes

:*
T0
?
dnn/hiddenlayer_2/MatMulMatMul-dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1dnn/hiddenlayer_2/kernel*
transpose_b( *
T0*
transpose_a( *'
_output_shapes
:?????????

%dnn/hiddenlayer_2/bias/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0*
dtype0*
_output_shapes
:
n
dnn/hiddenlayer_2/biasIdentity%dnn/hiddenlayer_2/bias/ReadVariableOp*
_output_shapes
:*
T0
?
dnn/hiddenlayer_2/BiasAddBiasAdddnn/hiddenlayer_2/MatMuldnn/hiddenlayer_2/bias*
T0*
data_formatNHWC*'
_output_shapes
:?????????
k
dnn/hiddenlayer_2/ReluReludnn/hiddenlayer_2/BiasAdd*
T0*'
_output_shapes
:?????????
?
;dnn/hiddenlayer_2/batchnorm_2/gamma/part_0/Initializer/onesConst*=
_class3
1/loc:@dnn/hiddenlayer_2/batchnorm_2/gamma/part_0*
valueB*  ??*
dtype0*
_output_shapes
:
?
*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0VarHandleOp*
shape:*
dtype0*
_output_shapes
: *;
shared_name,*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0*=
_class3
1/loc:@dnn/hiddenlayer_2/batchnorm_2/gamma/part_0*
	container 
?
Kdnn/hiddenlayer_2/batchnorm_2/gamma/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0*
_output_shapes
: 
?
1dnn/hiddenlayer_2/batchnorm_2/gamma/part_0/AssignAssignVariableOp*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0;dnn/hiddenlayer_2/batchnorm_2/gamma/part_0/Initializer/ones*
dtype0*=
_class3
1/loc:@dnn/hiddenlayer_2/batchnorm_2/gamma/part_0
?
>dnn/hiddenlayer_2/batchnorm_2/gamma/part_0/Read/ReadVariableOpReadVariableOp*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0*=
_class3
1/loc:@dnn/hiddenlayer_2/batchnorm_2/gamma/part_0*
dtype0*
_output_shapes
:
?
;dnn/hiddenlayer_2/batchnorm_2/beta/part_0/Initializer/zerosConst*<
_class2
0.loc:@dnn/hiddenlayer_2/batchnorm_2/beta/part_0*
valueB*    *
dtype0*
_output_shapes
:
?
)dnn/hiddenlayer_2/batchnorm_2/beta/part_0VarHandleOp*
dtype0*
_output_shapes
: *:
shared_name+)dnn/hiddenlayer_2/batchnorm_2/beta/part_0*<
_class2
0.loc:@dnn/hiddenlayer_2/batchnorm_2/beta/part_0*
	container *
shape:
?
Jdnn/hiddenlayer_2/batchnorm_2/beta/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp)dnn/hiddenlayer_2/batchnorm_2/beta/part_0*
_output_shapes
: 
?
0dnn/hiddenlayer_2/batchnorm_2/beta/part_0/AssignAssignVariableOp)dnn/hiddenlayer_2/batchnorm_2/beta/part_0;dnn/hiddenlayer_2/batchnorm_2/beta/part_0/Initializer/zeros*
dtype0*<
_class2
0.loc:@dnn/hiddenlayer_2/batchnorm_2/beta/part_0
?
=dnn/hiddenlayer_2/batchnorm_2/beta/part_0/Read/ReadVariableOpReadVariableOp)dnn/hiddenlayer_2/batchnorm_2/beta/part_0*
dtype0*
_output_shapes
:*<
_class2
0.loc:@dnn/hiddenlayer_2/batchnorm_2/beta/part_0
?
;dnn/hiddenlayer_2/batchnorm_2/moving_mean/Initializer/zerosConst*
dtype0*
_output_shapes
:*<
_class2
0.loc:@dnn/hiddenlayer_2/batchnorm_2/moving_mean*
valueB*    
?
)dnn/hiddenlayer_2/batchnorm_2/moving_meanVarHandleOp*:
shared_name+)dnn/hiddenlayer_2/batchnorm_2/moving_mean*<
_class2
0.loc:@dnn/hiddenlayer_2/batchnorm_2/moving_mean*
	container *
shape:*
dtype0*
_output_shapes
: 
?
Jdnn/hiddenlayer_2/batchnorm_2/moving_mean/IsInitialized/VarIsInitializedOpVarIsInitializedOp)dnn/hiddenlayer_2/batchnorm_2/moving_mean*
_output_shapes
: 
?
0dnn/hiddenlayer_2/batchnorm_2/moving_mean/AssignAssignVariableOp)dnn/hiddenlayer_2/batchnorm_2/moving_mean;dnn/hiddenlayer_2/batchnorm_2/moving_mean/Initializer/zeros*
dtype0*<
_class2
0.loc:@dnn/hiddenlayer_2/batchnorm_2/moving_mean
?
=dnn/hiddenlayer_2/batchnorm_2/moving_mean/Read/ReadVariableOpReadVariableOp)dnn/hiddenlayer_2/batchnorm_2/moving_mean*
dtype0*
_output_shapes
:*<
_class2
0.loc:@dnn/hiddenlayer_2/batchnorm_2/moving_mean
?
>dnn/hiddenlayer_2/batchnorm_2/moving_variance/Initializer/onesConst*@
_class6
42loc:@dnn/hiddenlayer_2/batchnorm_2/moving_variance*
valueB*  ??*
dtype0*
_output_shapes
:
?
-dnn/hiddenlayer_2/batchnorm_2/moving_varianceVarHandleOp*
shape:*
dtype0*
_output_shapes
: *>
shared_name/-dnn/hiddenlayer_2/batchnorm_2/moving_variance*@
_class6
42loc:@dnn/hiddenlayer_2/batchnorm_2/moving_variance*
	container 
?
Ndnn/hiddenlayer_2/batchnorm_2/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp-dnn/hiddenlayer_2/batchnorm_2/moving_variance*
_output_shapes
: 
?
4dnn/hiddenlayer_2/batchnorm_2/moving_variance/AssignAssignVariableOp-dnn/hiddenlayer_2/batchnorm_2/moving_variance>dnn/hiddenlayer_2/batchnorm_2/moving_variance/Initializer/ones*@
_class6
42loc:@dnn/hiddenlayer_2/batchnorm_2/moving_variance*
dtype0
?
Adnn/hiddenlayer_2/batchnorm_2/moving_variance/Read/ReadVariableOpReadVariableOp-dnn/hiddenlayer_2/batchnorm_2/moving_variance*
dtype0*
_output_shapes
:*@
_class6
42loc:@dnn/hiddenlayer_2/batchnorm_2/moving_variance
?
1dnn/hiddenlayer_2/batchnorm_2/beta/ReadVariableOpReadVariableOp)dnn/hiddenlayer_2/batchnorm_2/beta/part_0*
dtype0*
_output_shapes
:
?
"dnn/hiddenlayer_2/batchnorm_2/betaIdentity1dnn/hiddenlayer_2/batchnorm_2/beta/ReadVariableOp*
T0*
_output_shapes
:
?
6dnn/hiddenlayer_2/batchnorm_2/batchnorm/ReadVariableOpReadVariableOp-dnn/hiddenlayer_2/batchnorm_2/moving_variance*
dtype0*
_output_shapes
:
r
-dnn/hiddenlayer_2/batchnorm_2/batchnorm/add/yConst*
dtype0*
_output_shapes
: *
valueB
 *o?:
?
+dnn/hiddenlayer_2/batchnorm_2/batchnorm/addAdd6dnn/hiddenlayer_2/batchnorm_2/batchnorm/ReadVariableOp-dnn/hiddenlayer_2/batchnorm_2/batchnorm/add/y*
T0*
_output_shapes
:
?
-dnn/hiddenlayer_2/batchnorm_2/batchnorm/RsqrtRsqrt+dnn/hiddenlayer_2/batchnorm_2/batchnorm/add*
T0*
_output_shapes
:
?
2dnn/hiddenlayer_2/batchnorm_2/gamma/ReadVariableOpReadVariableOp*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0*
dtype0*
_output_shapes
:
?
#dnn/hiddenlayer_2/batchnorm_2/gammaIdentity2dnn/hiddenlayer_2/batchnorm_2/gamma/ReadVariableOp*
T0*
_output_shapes
:
?
+dnn/hiddenlayer_2/batchnorm_2/batchnorm/mulMul-dnn/hiddenlayer_2/batchnorm_2/batchnorm/Rsqrt#dnn/hiddenlayer_2/batchnorm_2/gamma*
T0*
_output_shapes
:
?
-dnn/hiddenlayer_2/batchnorm_2/batchnorm/mul_1Muldnn/hiddenlayer_2/Relu+dnn/hiddenlayer_2/batchnorm_2/batchnorm/mul*
T0*'
_output_shapes
:?????????
?
8dnn/hiddenlayer_2/batchnorm_2/batchnorm/ReadVariableOp_1ReadVariableOp)dnn/hiddenlayer_2/batchnorm_2/moving_mean*
dtype0*
_output_shapes
:
?
-dnn/hiddenlayer_2/batchnorm_2/batchnorm/mul_2Mul8dnn/hiddenlayer_2/batchnorm_2/batchnorm/ReadVariableOp_1+dnn/hiddenlayer_2/batchnorm_2/batchnorm/mul*
T0*
_output_shapes
:
?
+dnn/hiddenlayer_2/batchnorm_2/batchnorm/subSub"dnn/hiddenlayer_2/batchnorm_2/beta-dnn/hiddenlayer_2/batchnorm_2/batchnorm/mul_2*
T0*
_output_shapes
:
?
-dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1Add-dnn/hiddenlayer_2/batchnorm_2/batchnorm/mul_1+dnn/hiddenlayer_2/batchnorm_2/batchnorm/sub*
T0*'
_output_shapes
:?????????
?
dnn/zero_fraction_2/SizeSize-dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1*
_output_shapes
: *
T0*
out_type0	
e
dnn/zero_fraction_2/LessEqual/yConst*
valueB	 R????*
dtype0	*
_output_shapes
: 
?
dnn/zero_fraction_2/LessEqual	LessEqualdnn/zero_fraction_2/Sizednn/zero_fraction_2/LessEqual/y*
T0	*
_output_shapes
: 
?
dnn/zero_fraction_2/cond/SwitchSwitchdnn/zero_fraction_2/LessEqualdnn/zero_fraction_2/LessEqual*
T0
*
_output_shapes
: : 
q
!dnn/zero_fraction_2/cond/switch_tIdentity!dnn/zero_fraction_2/cond/Switch:1*
T0
*
_output_shapes
: 
o
!dnn/zero_fraction_2/cond/switch_fIdentitydnn/zero_fraction_2/cond/Switch*
T0
*
_output_shapes
: 
l
 dnn/zero_fraction_2/cond/pred_idIdentitydnn/zero_fraction_2/LessEqual*
T0
*
_output_shapes
: 
?
,dnn/zero_fraction_2/cond/count_nonzero/zerosConst"^dnn/zero_fraction_2/cond/switch_t*
valueB
 *    *
dtype0*
_output_shapes
: 
?
/dnn/zero_fraction_2/cond/count_nonzero/NotEqualNotEqual8dnn/zero_fraction_2/cond/count_nonzero/NotEqual/Switch:1,dnn/zero_fraction_2/cond/count_nonzero/zeros*
T0*'
_output_shapes
:?????????
?
6dnn/zero_fraction_2/cond/count_nonzero/NotEqual/SwitchSwitch-dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1 dnn/zero_fraction_2/cond/pred_id*
T0*@
_class6
42loc:@dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1*:
_output_shapes(
&:?????????:?????????
?
+dnn/zero_fraction_2/cond/count_nonzero/CastCast/dnn/zero_fraction_2/cond/count_nonzero/NotEqual*

SrcT0
*
Truncate( *

DstT0*'
_output_shapes
:?????????
?
,dnn/zero_fraction_2/cond/count_nonzero/ConstConst"^dnn/zero_fraction_2/cond/switch_t*
dtype0*
_output_shapes
:*
valueB"       
?
4dnn/zero_fraction_2/cond/count_nonzero/nonzero_countSum+dnn/zero_fraction_2/cond/count_nonzero/Cast,dnn/zero_fraction_2/cond/count_nonzero/Const*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 
?
dnn/zero_fraction_2/cond/CastCast4dnn/zero_fraction_2/cond/count_nonzero/nonzero_count*
Truncate( *

DstT0	*
_output_shapes
: *

SrcT0
?
.dnn/zero_fraction_2/cond/count_nonzero_1/zerosConst"^dnn/zero_fraction_2/cond/switch_f*
dtype0*
_output_shapes
: *
valueB
 *    
?
1dnn/zero_fraction_2/cond/count_nonzero_1/NotEqualNotEqual8dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual/Switch.dnn/zero_fraction_2/cond/count_nonzero_1/zeros*
T0*'
_output_shapes
:?????????
?
8dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual/SwitchSwitch-dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1 dnn/zero_fraction_2/cond/pred_id*
T0*@
_class6
42loc:@dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1*:
_output_shapes(
&:?????????:?????????
?
-dnn/zero_fraction_2/cond/count_nonzero_1/CastCast1dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual*
Truncate( *

DstT0	*'
_output_shapes
:?????????*

SrcT0

?
.dnn/zero_fraction_2/cond/count_nonzero_1/ConstConst"^dnn/zero_fraction_2/cond/switch_f*
dtype0*
_output_shapes
:*
valueB"       
?
6dnn/zero_fraction_2/cond/count_nonzero_1/nonzero_countSum-dnn/zero_fraction_2/cond/count_nonzero_1/Cast.dnn/zero_fraction_2/cond/count_nonzero_1/Const*
T0	*
_output_shapes
: *

Tidx0*
	keep_dims( 
?
dnn/zero_fraction_2/cond/MergeMerge6dnn/zero_fraction_2/cond/count_nonzero_1/nonzero_countdnn/zero_fraction_2/cond/Cast*
T0	*
N*
_output_shapes
: : 
?
*dnn/zero_fraction_2/counts_to_fraction/subSubdnn/zero_fraction_2/Sizednn/zero_fraction_2/cond/Merge*
T0	*
_output_shapes
: 
?
+dnn/zero_fraction_2/counts_to_fraction/CastCast*dnn/zero_fraction_2/counts_to_fraction/sub*
Truncate( *

DstT0*
_output_shapes
: *

SrcT0	
?
-dnn/zero_fraction_2/counts_to_fraction/Cast_1Castdnn/zero_fraction_2/Size*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
: 
?
.dnn/zero_fraction_2/counts_to_fraction/truedivRealDiv+dnn/zero_fraction_2/counts_to_fraction/Cast-dnn/zero_fraction_2/counts_to_fraction/Cast_1*
T0*
_output_shapes
: 
y
dnn/zero_fraction_2/fractionIdentity.dnn/zero_fraction_2/counts_to_fraction/truediv*
T0*
_output_shapes
: 
?
2dnn/dnn/hiddenlayer_2/fraction_of_zero_values/tagsConst*>
value5B3 B-dnn/dnn/hiddenlayer_2/fraction_of_zero_values*
dtype0*
_output_shapes
: 
?
-dnn/dnn/hiddenlayer_2/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_2/fraction_of_zero_values/tagsdnn/zero_fraction_2/fraction*
T0*
_output_shapes
: 
?
$dnn/dnn/hiddenlayer_2/activation/tagConst*
dtype0*
_output_shapes
: *1
value(B& B dnn/dnn/hiddenlayer_2/activation
?
 dnn/dnn/hiddenlayer_2/activationHistogramSummary$dnn/dnn/hiddenlayer_2/activation/tag-dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1*
T0*
_output_shapes
: 
?
9dnn/logits/kernel/part_0/Initializer/random_uniform/shapeConst*+
_class!
loc:@dnn/logits/kernel/part_0*
valueB"      *
dtype0*
_output_shapes
:
?
7dnn/logits/kernel/part_0/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *+
_class!
loc:@dnn/logits/kernel/part_0*
valueB
 *q??
?
7dnn/logits/kernel/part_0/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *+
_class!
loc:@dnn/logits/kernel/part_0*
valueB
 *q??
?
Adnn/logits/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform9dnn/logits/kernel/part_0/Initializer/random_uniform/shape*
dtype0*
_output_shapes

:*
seedޱ?	*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
seed2?
?
7dnn/logits/kernel/part_0/Initializer/random_uniform/subSub7dnn/logits/kernel/part_0/Initializer/random_uniform/max7dnn/logits/kernel/part_0/Initializer/random_uniform/min*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
_output_shapes
: 
?
7dnn/logits/kernel/part_0/Initializer/random_uniform/mulMulAdnn/logits/kernel/part_0/Initializer/random_uniform/RandomUniform7dnn/logits/kernel/part_0/Initializer/random_uniform/sub*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
_output_shapes

:
?
3dnn/logits/kernel/part_0/Initializer/random_uniformAdd7dnn/logits/kernel/part_0/Initializer/random_uniform/mul7dnn/logits/kernel/part_0/Initializer/random_uniform/min*
T0*+
_class!
loc:@dnn/logits/kernel/part_0*
_output_shapes

:
?
dnn/logits/kernel/part_0VarHandleOp*
dtype0*
_output_shapes
: *)
shared_namednn/logits/kernel/part_0*+
_class!
loc:@dnn/logits/kernel/part_0*
	container *
shape
:
?
9dnn/logits/kernel/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/logits/kernel/part_0*
_output_shapes
: 
?
dnn/logits/kernel/part_0/AssignAssignVariableOpdnn/logits/kernel/part_03dnn/logits/kernel/part_0/Initializer/random_uniform*+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0
?
,dnn/logits/kernel/part_0/Read/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0*+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0*
_output_shapes

:
?
(dnn/logits/bias/part_0/Initializer/zerosConst*)
_class
loc:@dnn/logits/bias/part_0*
valueB*    *
dtype0*
_output_shapes
:
?
dnn/logits/bias/part_0VarHandleOp*
dtype0*
_output_shapes
: *'
shared_namednn/logits/bias/part_0*)
_class
loc:@dnn/logits/bias/part_0*
	container *
shape:
}
7dnn/logits/bias/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOpdnn/logits/bias/part_0*
_output_shapes
: 
?
dnn/logits/bias/part_0/AssignAssignVariableOpdnn/logits/bias/part_0(dnn/logits/bias/part_0/Initializer/zeros*
dtype0*)
_class
loc:@dnn/logits/bias/part_0
?
*dnn/logits/bias/part_0/Read/ReadVariableOpReadVariableOpdnn/logits/bias/part_0*
dtype0*
_output_shapes
:*)
_class
loc:@dnn/logits/bias/part_0
y
 dnn/logits/kernel/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0*
dtype0*
_output_shapes

:
h
dnn/logits/kernelIdentity dnn/logits/kernel/ReadVariableOp*
T0*
_output_shapes

:
?
dnn/logits/MatMulMatMul-dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1dnn/logits/kernel*
T0*
transpose_a( *'
_output_shapes
:?????????*
transpose_b( 
q
dnn/logits/bias/ReadVariableOpReadVariableOpdnn/logits/bias/part_0*
dtype0*
_output_shapes
:
`
dnn/logits/biasIdentitydnn/logits/bias/ReadVariableOp*
T0*
_output_shapes
:
?
dnn/logits/BiasAddBiasAdddnn/logits/MatMuldnn/logits/bias*
T0*
data_formatNHWC*'
_output_shapes
:?????????
e
dnn/zero_fraction_3/SizeSizednn/logits/BiasAdd*
T0*
out_type0	*
_output_shapes
: 
e
dnn/zero_fraction_3/LessEqual/yConst*
dtype0	*
_output_shapes
: *
valueB	 R????
?
dnn/zero_fraction_3/LessEqual	LessEqualdnn/zero_fraction_3/Sizednn/zero_fraction_3/LessEqual/y*
T0	*
_output_shapes
: 
?
dnn/zero_fraction_3/cond/SwitchSwitchdnn/zero_fraction_3/LessEqualdnn/zero_fraction_3/LessEqual*
T0
*
_output_shapes
: : 
q
!dnn/zero_fraction_3/cond/switch_tIdentity!dnn/zero_fraction_3/cond/Switch:1*
T0
*
_output_shapes
: 
o
!dnn/zero_fraction_3/cond/switch_fIdentitydnn/zero_fraction_3/cond/Switch*
T0
*
_output_shapes
: 
l
 dnn/zero_fraction_3/cond/pred_idIdentitydnn/zero_fraction_3/LessEqual*
T0
*
_output_shapes
: 
?
,dnn/zero_fraction_3/cond/count_nonzero/zerosConst"^dnn/zero_fraction_3/cond/switch_t*
valueB
 *    *
dtype0*
_output_shapes
: 
?
/dnn/zero_fraction_3/cond/count_nonzero/NotEqualNotEqual8dnn/zero_fraction_3/cond/count_nonzero/NotEqual/Switch:1,dnn/zero_fraction_3/cond/count_nonzero/zeros*
T0*'
_output_shapes
:?????????
?
6dnn/zero_fraction_3/cond/count_nonzero/NotEqual/SwitchSwitchdnn/logits/BiasAdd dnn/zero_fraction_3/cond/pred_id*
T0*%
_class
loc:@dnn/logits/BiasAdd*:
_output_shapes(
&:?????????:?????????
?
+dnn/zero_fraction_3/cond/count_nonzero/CastCast/dnn/zero_fraction_3/cond/count_nonzero/NotEqual*
Truncate( *

DstT0*'
_output_shapes
:?????????*

SrcT0

?
,dnn/zero_fraction_3/cond/count_nonzero/ConstConst"^dnn/zero_fraction_3/cond/switch_t*
valueB"       *
dtype0*
_output_shapes
:
?
4dnn/zero_fraction_3/cond/count_nonzero/nonzero_countSum+dnn/zero_fraction_3/cond/count_nonzero/Cast,dnn/zero_fraction_3/cond/count_nonzero/Const*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 
?
dnn/zero_fraction_3/cond/CastCast4dnn/zero_fraction_3/cond/count_nonzero/nonzero_count*

SrcT0*
Truncate( *

DstT0	*
_output_shapes
: 
?
.dnn/zero_fraction_3/cond/count_nonzero_1/zerosConst"^dnn/zero_fraction_3/cond/switch_f*
dtype0*
_output_shapes
: *
valueB
 *    
?
1dnn/zero_fraction_3/cond/count_nonzero_1/NotEqualNotEqual8dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual/Switch.dnn/zero_fraction_3/cond/count_nonzero_1/zeros*
T0*'
_output_shapes
:?????????
?
8dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual/SwitchSwitchdnn/logits/BiasAdd dnn/zero_fraction_3/cond/pred_id*
T0*%
_class
loc:@dnn/logits/BiasAdd*:
_output_shapes(
&:?????????:?????????
?
-dnn/zero_fraction_3/cond/count_nonzero_1/CastCast1dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual*

SrcT0
*
Truncate( *

DstT0	*'
_output_shapes
:?????????
?
.dnn/zero_fraction_3/cond/count_nonzero_1/ConstConst"^dnn/zero_fraction_3/cond/switch_f*
valueB"       *
dtype0*
_output_shapes
:
?
6dnn/zero_fraction_3/cond/count_nonzero_1/nonzero_countSum-dnn/zero_fraction_3/cond/count_nonzero_1/Cast.dnn/zero_fraction_3/cond/count_nonzero_1/Const*
T0	*
_output_shapes
: *

Tidx0*
	keep_dims( 
?
dnn/zero_fraction_3/cond/MergeMerge6dnn/zero_fraction_3/cond/count_nonzero_1/nonzero_countdnn/zero_fraction_3/cond/Cast*
N*
_output_shapes
: : *
T0	
?
*dnn/zero_fraction_3/counts_to_fraction/subSubdnn/zero_fraction_3/Sizednn/zero_fraction_3/cond/Merge*
T0	*
_output_shapes
: 
?
+dnn/zero_fraction_3/counts_to_fraction/CastCast*dnn/zero_fraction_3/counts_to_fraction/sub*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
: 
?
-dnn/zero_fraction_3/counts_to_fraction/Cast_1Castdnn/zero_fraction_3/Size*
Truncate( *

DstT0*
_output_shapes
: *

SrcT0	
?
.dnn/zero_fraction_3/counts_to_fraction/truedivRealDiv+dnn/zero_fraction_3/counts_to_fraction/Cast-dnn/zero_fraction_3/counts_to_fraction/Cast_1*
_output_shapes
: *
T0
y
dnn/zero_fraction_3/fractionIdentity.dnn/zero_fraction_3/counts_to_fraction/truediv*
T0*
_output_shapes
: 
?
+dnn/dnn/logits/fraction_of_zero_values/tagsConst*
dtype0*
_output_shapes
: *7
value.B, B&dnn/dnn/logits/fraction_of_zero_values
?
&dnn/dnn/logits/fraction_of_zero_valuesScalarSummary+dnn/dnn/logits/fraction_of_zero_values/tagsdnn/zero_fraction_3/fraction*
T0*
_output_shapes
: 
w
dnn/dnn/logits/activation/tagConst**
value!B Bdnn/dnn/logits/activation*
dtype0*
_output_shapes
: 
?
dnn/dnn/logits/activationHistogramSummarydnn/dnn/logits/activation/tagdnn/logits/BiasAdd*
T0*
_output_shapes
: 
c
head/logits/ShapeShapednn/logits/BiasAdd*
_output_shapes
:*
T0*
out_type0
g
%head/logits/assert_rank_at_least/rankConst*
value	B :*
dtype0*
_output_shapes
: 
W
Ohead/logits/assert_rank_at_least/assert_type/statically_determined_correct_typeNoOp
H
@head/logits/assert_rank_at_least/static_checks_determined_all_okNoOp
e
head/labels/ExpandDims/dimConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
?
head/labels/ExpandDims
ExpandDimsIteratorGetNext:9head/labels/ExpandDims/dim*
T0*'
_output_shapes
:?????????*

Tdim0
g
head/labels/ShapeShapehead/labels/ExpandDims*
T0*
out_type0*
_output_shapes
:
e
head/labels/Shape_1Shapednn/logits/BiasAdd*
T0*
out_type0*
_output_shapes
:
g
%head/labels/assert_rank_at_least/rankConst*
value	B :*
dtype0*
_output_shapes
: 
|
&head/labels/assert_rank_at_least/ShapeShapehead/labels/ExpandDims*
T0*
out_type0*
_output_shapes
:
W
Ohead/labels/assert_rank_at_least/assert_type/statically_determined_correct_typeNoOp
H
@head/labels/assert_rank_at_least/static_checks_determined_all_okNoOp
?
head/labels/strided_slice/stackConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB: *
dtype0*
_output_shapes
:
?
!head/labels/strided_slice/stack_1ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB:
?????????*
dtype0*
_output_shapes
:
?
!head/labels/strided_slice/stack_2ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB:*
dtype0*
_output_shapes
:
?
head/labels/strided_sliceStridedSlicehead/labels/Shape_1head/labels/strided_slice/stack!head/labels/strided_slice/stack_1!head/labels/strided_slice/stack_2*
shrink_axis_mask *
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask *
_output_shapes
:*
Index0*
T0
?
head/labels/concat/values_1ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB:*
dtype0*
_output_shapes
:
?
head/labels/concat/axisConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
value	B : *
dtype0*
_output_shapes
: 
?
head/labels/concatConcatV2head/labels/strided_slicehead/labels/concat/values_1head/labels/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
s
head/labels/assert_equal/EqualEqualhead/labels/concathead/labels/Shape*
T0*
_output_shapes
:
?
head/labels/assert_equal/ConstConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB: *
dtype0*
_output_shapes
:
?
head/labels/assert_equal/AllAllhead/labels/assert_equal/Equalhead/labels/assert_equal/Const*

Tidx0*
	keep_dims( *
_output_shapes
: 
?
%head/labels/assert_equal/Assert/ConstConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
dtype0*
_output_shapes
: *(
valueB Bexpected_labels_shape: 
?
'head/labels/assert_equal/Assert/Const_1ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB Blabels_shape: *
dtype0*
_output_shapes
: 
?
-head/labels/assert_equal/Assert/Assert/data_0ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
dtype0*
_output_shapes
: *(
valueB Bexpected_labels_shape: 
?
-head/labels/assert_equal/Assert/Assert/data_2ConstA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*
valueB Blabels_shape: *
dtype0*
_output_shapes
: 
?
&head/labels/assert_equal/Assert/AssertAsserthead/labels/assert_equal/All-head/labels/assert_equal/Assert/Assert/data_0head/labels/concat-head/labels/assert_equal/Assert/Assert/data_2head/labels/Shape*
T
2*
	summarize
?
head/labelsIdentityhead/labels/ExpandDims'^head/labels/assert_equal/Assert/AssertA^head/labels/assert_rank_at_least/static_checks_determined_all_ok*'
_output_shapes
:?????????*
T0
?
)head/mean_squared_error/SquaredDifferenceSquaredDifferencednn/logits/BiasAddhead/labels*
T0*'
_output_shapes
:?????????
y
4head/mean_squared_error/assert_broadcastable/weightsConst*
valueB
 *  ??*
dtype0*
_output_shapes
: 
}
:head/mean_squared_error/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 
{
9head/mean_squared_error/assert_broadcastable/weights/rankConst*
value	B : *
dtype0*
_output_shapes
: 
?
9head/mean_squared_error/assert_broadcastable/values/shapeShape)head/mean_squared_error/SquaredDifference*
T0*
out_type0*
_output_shapes
:
z
8head/mean_squared_error/assert_broadcastable/values/rankConst*
value	B :*
dtype0*
_output_shapes
: 
P
Hhead/mean_squared_error/assert_broadcastable/static_scalar_check_successNoOp
?
!head/mean_squared_error/ToFloat/xConstI^head/mean_squared_error/assert_broadcastable/static_scalar_check_success*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
head/mean_squared_error/MulMul)head/mean_squared_error/SquaredDifference!head/mean_squared_error/ToFloat/x*
T0*'
_output_shapes
:?????????
t
/head/weighted_loss/assert_broadcastable/weightsConst*
valueB
 *  ??*
dtype0*
_output_shapes
: 
x
5head/weighted_loss/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 
v
4head/weighted_loss/assert_broadcastable/weights/rankConst*
dtype0*
_output_shapes
: *
value	B : 
?
4head/weighted_loss/assert_broadcastable/values/shapeShapehead/mean_squared_error/Mul*
T0*
out_type0*
_output_shapes
:
u
3head/weighted_loss/assert_broadcastable/values/rankConst*
dtype0*
_output_shapes
: *
value	B :
K
Chead/weighted_loss/assert_broadcastable/static_scalar_check_successNoOp
?
head/weighted_loss/ToFloat/xConstD^head/weighted_loss/assert_broadcastable/static_scalar_check_success*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
head/weighted_loss/MulMulhead/mean_squared_error/Mulhead/weighted_loss/ToFloat/x*
T0*'
_output_shapes
:?????????
?
head/weighted_loss/ConstConstD^head/weighted_loss/assert_broadcastable/static_scalar_check_success*
valueB"       *
dtype0*
_output_shapes
:
?
head/weighted_loss/SumSumhead/weighted_loss/Mulhead/weighted_loss/Const*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 
?
mean/total/Initializer/zerosConst*
dtype0*
_output_shapes
: *
_class
loc:@mean/total*
valueB
 *    
?

mean/total
VariableV2*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name *
_class
loc:@mean/total
?
mean/total/AssignAssign
mean/totalmean/total/Initializer/zeros*
use_locking(*
T0*
_class
loc:@mean/total*
validate_shape(*
_output_shapes
: 
g
mean/total/readIdentity
mean/total*
T0*
_class
loc:@mean/total*
_output_shapes
: 
?
mean/count/Initializer/zerosConst*
_class
loc:@mean/count*
valueB
 *    *
dtype0*
_output_shapes
: 
?

mean/count
VariableV2*
_class
loc:@mean/count*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name 
?
mean/count/AssignAssign
mean/countmean/count/Initializer/zeros*
T0*
_class
loc:@mean/count*
validate_shape(*
_output_shapes
: *
use_locking(
g
mean/count/readIdentity
mean/count*
T0*
_class
loc:@mean/count*
_output_shapes
: 
O

mean/ConstConst*
valueB
 *  ??*
dtype0*
_output_shapes
: 
|
9mean/broadcast_weights/assert_broadcastable/weights/shapeConst*
dtype0*
_output_shapes
: *
valueB 
z
8mean/broadcast_weights/assert_broadcastable/weights/rankConst*
dtype0*
_output_shapes
: *
value	B : 
?
8mean/broadcast_weights/assert_broadcastable/values/shapeShapehead/mean_squared_error/Mul*
T0*
out_type0*
_output_shapes
:
y
7mean/broadcast_weights/assert_broadcastable/values/rankConst*
value	B :*
dtype0*
_output_shapes
: 
O
Gmean/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOp
?
&mean/broadcast_weights/ones_like/ShapeShapehead/mean_squared_error/MulH^mean/broadcast_weights/assert_broadcastable/static_scalar_check_success*
T0*
out_type0*
_output_shapes
:
?
&mean/broadcast_weights/ones_like/ConstConstH^mean/broadcast_weights/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
: *
valueB
 *  ??
?
 mean/broadcast_weights/ones_likeFill&mean/broadcast_weights/ones_like/Shape&mean/broadcast_weights/ones_like/Const*'
_output_shapes
:?????????*
T0*

index_type0
}
mean/broadcast_weightsMul
mean/Const mean/broadcast_weights/ones_like*'
_output_shapes
:?????????*
T0
v
mean/MulMulhead/mean_squared_error/Mulmean/broadcast_weights*'
_output_shapes
:?????????*
T0
]
mean/Const_1Const*
valueB"       *
dtype0*
_output_shapes
:
s
mean/SumSummean/broadcast_weightsmean/Const_1*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0
]
mean/Const_2Const*
valueB"       *
dtype0*
_output_shapes
:
g

mean/Sum_1Summean/Mulmean/Const_2*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0
?
mean/AssignAdd	AssignAdd
mean/total
mean/Sum_1*
use_locking( *
T0*
_class
loc:@mean/total*
_output_shapes
: 
?
mean/AssignAdd_1	AssignAdd
mean/countmean/Sum	^mean/Mul*
use_locking( *
T0*
_class
loc:@mean/count*
_output_shapes
: 
S
mean/Maximum/yConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Y
mean/MaximumMaximummean/count/readmean/Maximum/y*
T0*
_output_shapes
: 
V

mean/valueDivNoNanmean/total/readmean/Maximum*
_output_shapes
: *
T0
U
mean/Maximum_1/yConst*
dtype0*
_output_shapes
: *
valueB
 *    
^
mean/Maximum_1Maximummean/AssignAdd_1mean/Maximum_1/y*
T0*
_output_shapes
: 
[
mean/update_opDivNoNanmean/AssignAddmean/Maximum_1*
T0*
_output_shapes
: 
n
)prediction/mean/broadcast_weights/weightsConst*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Dprediction/mean/broadcast_weights/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 
?
Cprediction/mean/broadcast_weights/assert_broadcastable/weights/rankConst*
value	B : *
dtype0*
_output_shapes
: 
?
Cprediction/mean/broadcast_weights/assert_broadcastable/values/shapeShapednn/logits/BiasAdd*
_output_shapes
:*
T0*
out_type0
?
Bprediction/mean/broadcast_weights/assert_broadcastable/values/rankConst*
dtype0*
_output_shapes
: *
value	B :
Z
Rprediction/mean/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOp
?
1prediction/mean/broadcast_weights/ones_like/ShapeShapednn/logits/BiasAddS^prediction/mean/broadcast_weights/assert_broadcastable/static_scalar_check_success*
T0*
out_type0*
_output_shapes
:
?
1prediction/mean/broadcast_weights/ones_like/ConstConstS^prediction/mean/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
+prediction/mean/broadcast_weights/ones_likeFill1prediction/mean/broadcast_weights/ones_like/Shape1prediction/mean/broadcast_weights/ones_like/Const*'
_output_shapes
:?????????*
T0*

index_type0
?
!prediction/mean/broadcast_weightsMul)prediction/mean/broadcast_weights/weights+prediction/mean/broadcast_weights/ones_like*
T0*'
_output_shapes
:?????????
?
'prediction/mean/total/Initializer/zerosConst*(
_class
loc:@prediction/mean/total*
valueB
 *    *
dtype0*
_output_shapes
: 
?
prediction/mean/total
VariableV2*
shared_name *(
_class
loc:@prediction/mean/total*
	container *
shape: *
dtype0*
_output_shapes
: 
?
prediction/mean/total/AssignAssignprediction/mean/total'prediction/mean/total/Initializer/zeros*
T0*(
_class
loc:@prediction/mean/total*
validate_shape(*
_output_shapes
: *
use_locking(
?
prediction/mean/total/readIdentityprediction/mean/total*
_output_shapes
: *
T0*(
_class
loc:@prediction/mean/total
?
'prediction/mean/count/Initializer/zerosConst*(
_class
loc:@prediction/mean/count*
valueB
 *    *
dtype0*
_output_shapes
: 
?
prediction/mean/count
VariableV2*(
_class
loc:@prediction/mean/count*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name 
?
prediction/mean/count/AssignAssignprediction/mean/count'prediction/mean/count/Initializer/zeros*
use_locking(*
T0*(
_class
loc:@prediction/mean/count*
validate_shape(*
_output_shapes
: 
?
prediction/mean/count/readIdentityprediction/mean/count*
T0*(
_class
loc:@prediction/mean/count*
_output_shapes
: 
?
Fprediction/mean/broadcast_weights_1/assert_broadcastable/weights/shapeShape!prediction/mean/broadcast_weights*
_output_shapes
:*
T0*
out_type0
?
Eprediction/mean/broadcast_weights_1/assert_broadcastable/weights/rankConst*
value	B :*
dtype0*
_output_shapes
: 
?
Eprediction/mean/broadcast_weights_1/assert_broadcastable/values/shapeShapednn/logits/BiasAdd*
T0*
out_type0*
_output_shapes
:
?
Dprediction/mean/broadcast_weights_1/assert_broadcastable/values/rankConst*
value	B :*
dtype0*
_output_shapes
: 
?
Dprediction/mean/broadcast_weights_1/assert_broadcastable/is_scalar/xConst*
value	B : *
dtype0*
_output_shapes
: 
?
Bprediction/mean/broadcast_weights_1/assert_broadcastable/is_scalarEqualDprediction/mean/broadcast_weights_1/assert_broadcastable/is_scalar/xEprediction/mean/broadcast_weights_1/assert_broadcastable/weights/rank*
T0*
_output_shapes
: 
?
Nprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/SwitchSwitchBprediction/mean/broadcast_weights_1/assert_broadcastable/is_scalarBprediction/mean/broadcast_weights_1/assert_broadcastable/is_scalar*
_output_shapes
: : *
T0

?
Pprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/switch_tIdentityPprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/Switch:1*
T0
*
_output_shapes
: 
?
Pprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/switch_fIdentityNprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/Switch*
T0
*
_output_shapes
: 
?
Oprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/pred_idIdentityBprediction/mean/broadcast_weights_1/assert_broadcastable/is_scalar*
T0
*
_output_shapes
: 
?
Pprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/Switch_1SwitchBprediction/mean/broadcast_weights_1/assert_broadcastable/is_scalarOprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/pred_id*
T0
*U
_classK
IGloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/is_scalar*
_output_shapes
: : 
?
nprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rankEqualuprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rank/Switchwprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rank/Switch_1*
T0*
_output_shapes
: 
?
uprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rank/SwitchSwitchDprediction/mean/broadcast_weights_1/assert_broadcastable/values/rankOprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/pred_id*
T0*W
_classM
KIloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/values/rank*
_output_shapes
: : 
?
wprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rank/Switch_1SwitchEprediction/mean/broadcast_weights_1/assert_broadcastable/weights/rankOprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/pred_id*
T0*X
_classN
LJloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/weights/rank*
_output_shapes
: : 
?
hprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/SwitchSwitchnprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_ranknprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rank*
T0
*
_output_shapes
: : 
?
jprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/switch_tIdentityjprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/Switch:1*
T0
*
_output_shapes
: 
?
jprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/switch_fIdentityhprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/Switch*
T0
*
_output_shapes
: 
?
iprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/pred_idIdentitynprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rank*
T0
*
_output_shapes
: 
?
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims/dimConstk^prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/switch_t*
valueB :
?????????*
dtype0*
_output_shapes
: 
?
}prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims
ExpandDims?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims/Switch_1:1?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims/dim*

Tdim0*
T0*
_output_shapes

:
?
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims/SwitchSwitchEprediction/mean/broadcast_weights_1/assert_broadcastable/values/shapeOprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/pred_id*
T0*X
_classN
LJloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/values/shape* 
_output_shapes
::
?
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims/Switch_1Switch?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims/Switchiprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/pred_id*
T0*X
_classN
LJloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/values/shape* 
_output_shapes
::
?
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ones_like/ShapeConstk^prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/switch_t*
dtype0*
_output_shapes
:*
valueB"      
?
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ones_like/ConstConstk^prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/switch_t*
value	B :*
dtype0*
_output_shapes
: 
?
|prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ones_likeFill?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ones_like/Shape?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ones_like/Const*
T0*

index_type0*
_output_shapes

:
?
~prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/concat/axisConstk^prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/switch_t*
value	B :*
dtype0*
_output_shapes
: 
?
yprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/concatConcatV2}prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims|prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ones_like~prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/concat/axis*
T0*
N*
_output_shapes

:*

Tidx0
?
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1/dimConstk^prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/switch_t*
valueB :
?????????*
dtype0*
_output_shapes
: 
?
prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1
ExpandDims?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1/Switch_1:1?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1/dim*

Tdim0*
T0*
_output_shapes

:
?
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1/SwitchSwitchFprediction/mean/broadcast_weights_1/assert_broadcastable/weights/shapeOprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/pred_id*
T0*Y
_classO
MKloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/weights/shape* 
_output_shapes
::
?
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1/Switch_1Switch?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1/Switchiprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/pred_id*
T0*Y
_classO
MKloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/weights/shape* 
_output_shapes
::
?
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/DenseToDenseSetOperationDenseToDenseSetOperationprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1yprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/concat*
set_operationa-b*
T0*
validate_indices(*<
_output_shapes*
(:?????????:?????????:
?
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/num_invalid_dimsSize?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/DenseToDenseSetOperation:1*
_output_shapes
: *
T0*
out_type0
?
tprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/xConstk^prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/switch_t*
value	B : *
dtype0*
_output_shapes
: 
?
rprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dimsEqualtprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/x?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/num_invalid_dims*
T0*
_output_shapes
: 
?
jprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/Switch_1Switchnprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rankiprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/pred_id*
_output_shapes
: : *
T0
*?
_classw
usloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rank
?
gprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/MergeMergejprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/Switch_1rprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims*
T0
*
N*
_output_shapes
: : 
?
Mprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/MergeMergegprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/MergeRprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/Switch_1:1*
T0
*
N*
_output_shapes
: : 
?
>prediction/mean/broadcast_weights_1/assert_broadcastable/ConstConst*8
value/B- B'weights can not be broadcast to values.*
dtype0*
_output_shapes
: 
?
@prediction/mean/broadcast_weights_1/assert_broadcastable/Const_1Const*
dtype0*
_output_shapes
: *
valueB Bweights.shape=
?
@prediction/mean/broadcast_weights_1/assert_broadcastable/Const_2Const*4
value+B) B#prediction/mean/broadcast_weights:0*
dtype0*
_output_shapes
: 
?
@prediction/mean/broadcast_weights_1/assert_broadcastable/Const_3Const*
valueB Bvalues.shape=*
dtype0*
_output_shapes
: 
?
@prediction/mean/broadcast_weights_1/assert_broadcastable/Const_4Const*%
valueB Bdnn/logits/BiasAdd:0*
dtype0*
_output_shapes
: 
?
@prediction/mean/broadcast_weights_1/assert_broadcastable/Const_5Const*
valueB B
is_scalar=*
dtype0*
_output_shapes
: 
?
Kprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/SwitchSwitchMprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/MergeMprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/Merge*
T0
*
_output_shapes
: : 
?
Mprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_tIdentityMprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Switch:1*
_output_shapes
: *
T0

?
Mprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_fIdentityKprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Switch*
_output_shapes
: *
T0

?
Lprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/pred_idIdentityMprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/Merge*
_output_shapes
: *
T0

?
Iprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/NoOpNoOpN^prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_t
?
Wprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/control_dependencyIdentityMprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_tJ^prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/NoOp*
T0
*`
_classV
TRloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_t*
_output_shapes
: 
?
Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_0ConstN^prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_f*
dtype0*
_output_shapes
: *8
value/B- B'weights can not be broadcast to values.
?
Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_1ConstN^prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_f*
valueB Bweights.shape=*
dtype0*
_output_shapes
: 
?
Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_2ConstN^prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_f*4
value+B) B#prediction/mean/broadcast_weights:0*
dtype0*
_output_shapes
: 
?
Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_4ConstN^prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_f*
valueB Bvalues.shape=*
dtype0*
_output_shapes
: 
?
Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_5ConstN^prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_f*%
valueB Bdnn/logits/BiasAdd:0*
dtype0*
_output_shapes
: 
?
Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_7ConstN^prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_f*
valueB B
is_scalar=*
dtype0*
_output_shapes
: 
?
Kprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/AssertAssertRprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/SwitchRprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_0Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_1Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_2Tprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/Switch_1Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_4Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_5Tprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/Switch_2Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_7Tprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/Switch_3*
T
2	
*
	summarize
?
Rprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/SwitchSwitchMprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/MergeLprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/pred_id*
T0
*`
_classV
TRloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/Merge*
_output_shapes
: : 
?
Tprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/Switch_1SwitchFprediction/mean/broadcast_weights_1/assert_broadcastable/weights/shapeLprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/pred_id*
T0*Y
_classO
MKloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/weights/shape* 
_output_shapes
::
?
Tprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/Switch_2SwitchEprediction/mean/broadcast_weights_1/assert_broadcastable/values/shapeLprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/pred_id* 
_output_shapes
::*
T0*X
_classN
LJloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/values/shape
?
Tprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/Switch_3SwitchBprediction/mean/broadcast_weights_1/assert_broadcastable/is_scalarLprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/pred_id*
T0
*U
_classK
IGloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/is_scalar*
_output_shapes
: : 
?
Yprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/control_dependency_1IdentityMprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_fL^prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert*
_output_shapes
: *
T0
*`
_classV
TRloc:@prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_f
?
Jprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/MergeMergeYprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/control_dependency_1Wprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/control_dependency*
T0
*
N*
_output_shapes
: : 
?
3prediction/mean/broadcast_weights_1/ones_like/ShapeShapednn/logits/BiasAddK^prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Merge*
T0*
out_type0*
_output_shapes
:
?
3prediction/mean/broadcast_weights_1/ones_like/ConstConstK^prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Merge*
dtype0*
_output_shapes
: *
valueB
 *  ??
?
-prediction/mean/broadcast_weights_1/ones_likeFill3prediction/mean/broadcast_weights_1/ones_like/Shape3prediction/mean/broadcast_weights_1/ones_like/Const*'
_output_shapes
:?????????*
T0*

index_type0
?
#prediction/mean/broadcast_weights_1Mul!prediction/mean/broadcast_weights-prediction/mean/broadcast_weights_1/ones_like*'
_output_shapes
:?????????*
T0
?
prediction/mean/MulMuldnn/logits/BiasAdd#prediction/mean/broadcast_weights_1*
T0*'
_output_shapes
:?????????
f
prediction/mean/ConstConst*
valueB"       *
dtype0*
_output_shapes
:
?
prediction/mean/SumSum#prediction/mean/broadcast_weights_1prediction/mean/Const*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 
h
prediction/mean/Const_1Const*
valueB"       *
dtype0*
_output_shapes
:
?
prediction/mean/Sum_1Sumprediction/mean/Mulprediction/mean/Const_1*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 
?
prediction/mean/AssignAdd	AssignAddprediction/mean/totalprediction/mean/Sum_1*
use_locking( *
T0*(
_class
loc:@prediction/mean/total*
_output_shapes
: 
?
prediction/mean/AssignAdd_1	AssignAddprediction/mean/countprediction/mean/Sum^prediction/mean/Mul*
use_locking( *
T0*(
_class
loc:@prediction/mean/count*
_output_shapes
: 
^
prediction/mean/Maximum/yConst*
valueB
 *    *
dtype0*
_output_shapes
: 
z
prediction/mean/MaximumMaximumprediction/mean/count/readprediction/mean/Maximum/y*
T0*
_output_shapes
: 
w
prediction/mean/valueDivNoNanprediction/mean/total/readprediction/mean/Maximum*
T0*
_output_shapes
: 
`
prediction/mean/Maximum_1/yConst*
valueB
 *    *
dtype0*
_output_shapes
: 

prediction/mean/Maximum_1Maximumprediction/mean/AssignAdd_1prediction/mean/Maximum_1/y*
T0*
_output_shapes
: 
|
prediction/mean/update_opDivNoNanprediction/mean/AssignAddprediction/mean/Maximum_1*
T0*
_output_shapes
: 
?
mean_1/total/Initializer/zerosConst*
_class
loc:@mean_1/total*
valueB
 *    *
dtype0*
_output_shapes
: 
?
mean_1/total
VariableV2*
dtype0*
_output_shapes
: *
shared_name *
_class
loc:@mean_1/total*
	container *
shape: 
?
mean_1/total/AssignAssignmean_1/totalmean_1/total/Initializer/zeros*
use_locking(*
T0*
_class
loc:@mean_1/total*
validate_shape(*
_output_shapes
: 
m
mean_1/total/readIdentitymean_1/total*
T0*
_class
loc:@mean_1/total*
_output_shapes
: 
?
mean_1/count/Initializer/zerosConst*
_class
loc:@mean_1/count*
valueB
 *    *
dtype0*
_output_shapes
: 
?
mean_1/count
VariableV2*
dtype0*
_output_shapes
: *
shared_name *
_class
loc:@mean_1/count*
	container *
shape: 
?
mean_1/count/AssignAssignmean_1/countmean_1/count/Initializer/zeros*
use_locking(*
T0*
_class
loc:@mean_1/count*
validate_shape(*
_output_shapes
: 
m
mean_1/count/readIdentitymean_1/count*
T0*
_class
loc:@mean_1/count*
_output_shapes
: 
Q
mean_1/ConstConst*
valueB
 *  ??*
dtype0*
_output_shapes
: 
~
;mean_1/broadcast_weights/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 
|
:mean_1/broadcast_weights/assert_broadcastable/weights/rankConst*
dtype0*
_output_shapes
: *
value	B : 
?
:mean_1/broadcast_weights/assert_broadcastable/values/shapeShapeIteratorGetNext:9*
T0*
out_type0*
_output_shapes
:
{
9mean_1/broadcast_weights/assert_broadcastable/values/rankConst*
value	B :*
dtype0*
_output_shapes
: 
Q
Imean_1/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOp
?
(mean_1/broadcast_weights/ones_like/ShapeShapeIteratorGetNext:9J^mean_1/broadcast_weights/assert_broadcastable/static_scalar_check_success*
T0*
out_type0*
_output_shapes
:
?
(mean_1/broadcast_weights/ones_like/ConstConstJ^mean_1/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
"mean_1/broadcast_weights/ones_likeFill(mean_1/broadcast_weights/ones_like/Shape(mean_1/broadcast_weights/ones_like/Const*
T0*

index_type0*#
_output_shapes
:?????????

mean_1/broadcast_weightsMulmean_1/Const"mean_1/broadcast_weights/ones_like*
T0*#
_output_shapes
:?????????
l

mean_1/MulMulIteratorGetNext:9mean_1/broadcast_weights*
T0*#
_output_shapes
:?????????
X
mean_1/Const_1Const*
dtype0*
_output_shapes
:*
valueB: 
y

mean_1/SumSummean_1/broadcast_weightsmean_1/Const_1*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 
X
mean_1/Const_2Const*
valueB: *
dtype0*
_output_shapes
:
m
mean_1/Sum_1Sum
mean_1/Mulmean_1/Const_2*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 
?
mean_1/AssignAdd	AssignAddmean_1/totalmean_1/Sum_1*
use_locking( *
T0*
_class
loc:@mean_1/total*
_output_shapes
: 
?
mean_1/AssignAdd_1	AssignAddmean_1/count
mean_1/Sum^mean_1/Mul*
use_locking( *
T0*
_class
loc:@mean_1/count*
_output_shapes
: 
U
mean_1/Maximum/yConst*
valueB
 *    *
dtype0*
_output_shapes
: 
_
mean_1/MaximumMaximummean_1/count/readmean_1/Maximum/y*
T0*
_output_shapes
: 
\
mean_1/valueDivNoNanmean_1/total/readmean_1/Maximum*
T0*
_output_shapes
: 
W
mean_1/Maximum_1/yConst*
valueB
 *    *
dtype0*
_output_shapes
: 
d
mean_1/Maximum_1Maximummean_1/AssignAdd_1mean_1/Maximum_1/y*
T0*
_output_shapes
: 
a
mean_1/update_opDivNoNanmean_1/AssignAddmean_1/Maximum_1*
T0*
_output_shapes
: 
?
mean_2/total/Initializer/zerosConst*
_class
loc:@mean_2/total*
valueB
 *    *
dtype0*
_output_shapes
: 
?
mean_2/total
VariableV2*
dtype0*
_output_shapes
: *
shared_name *
_class
loc:@mean_2/total*
	container *
shape: 
?
mean_2/total/AssignAssignmean_2/totalmean_2/total/Initializer/zeros*
use_locking(*
T0*
_class
loc:@mean_2/total*
validate_shape(*
_output_shapes
: 
m
mean_2/total/readIdentitymean_2/total*
T0*
_class
loc:@mean_2/total*
_output_shapes
: 
?
mean_2/count/Initializer/zerosConst*
_class
loc:@mean_2/count*
valueB
 *    *
dtype0*
_output_shapes
: 
?
mean_2/count
VariableV2*
dtype0*
_output_shapes
: *
shared_name *
_class
loc:@mean_2/count*
	container *
shape: 
?
mean_2/count/AssignAssignmean_2/countmean_2/count/Initializer/zeros*
use_locking(*
T0*
_class
loc:@mean_2/count*
validate_shape(*
_output_shapes
: 
m
mean_2/count/readIdentitymean_2/count*
_output_shapes
: *
T0*
_class
loc:@mean_2/count
M
mean_2/SizeConst*
value	B :*
dtype0*
_output_shapes
: 
c
mean_2/ToFloatCastmean_2/Size*

SrcT0*
Truncate( *

DstT0*
_output_shapes
: 
O
mean_2/ConstConst*
dtype0*
_output_shapes
: *
valueB 
u

mean_2/SumSumhead/weighted_loss/Summean_2/Const*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0
?
mean_2/AssignAdd	AssignAddmean_2/total
mean_2/Sum*
use_locking( *
T0*
_class
loc:@mean_2/total*
_output_shapes
: 
?
mean_2/AssignAdd_1	AssignAddmean_2/countmean_2/ToFloat^head/weighted_loss/Sum*
T0*
_class
loc:@mean_2/count*
_output_shapes
: *
use_locking( 
U
mean_2/Maximum/yConst*
dtype0*
_output_shapes
: *
valueB
 *    
_
mean_2/MaximumMaximummean_2/count/readmean_2/Maximum/y*
T0*
_output_shapes
: 
\
mean_2/valueDivNoNanmean_2/total/readmean_2/Maximum*
T0*
_output_shapes
: 
W
mean_2/Maximum_1/yConst*
valueB
 *    *
dtype0*
_output_shapes
: 
d
mean_2/Maximum_1Maximummean_2/AssignAdd_1mean_2/Maximum_1/y*
_output_shapes
: *
T0
a
mean_2/update_opDivNoNanmean_2/AssignAddmean_2/Maximum_1*
T0*
_output_shapes
: 
e

group_depsNoOp^mean/update_op^mean_1/update_op^mean_2/update_op^prediction/mean/update_op
{
eval_step/Initializer/zerosConst*
_class
loc:@eval_step*
value	B	 R *
dtype0	*
_output_shapes
: 
?
	eval_step
VariableV2*
shared_name *
_class
loc:@eval_step*
	container *
shape: *
dtype0	*
_output_shapes
: 
?
eval_step/AssignAssign	eval_stepeval_step/Initializer/zeros*
T0	*
_class
loc:@eval_step*
validate_shape(*
_output_shapes
: *
use_locking(
d
eval_step/readIdentity	eval_step*
T0	*
_class
loc:@eval_step*
_output_shapes
: 
Q
AssignAdd/valueConst*
value	B	 R*
dtype0	*
_output_shapes
: 
?
	AssignAdd	AssignAdd	eval_stepAssignAdd/value*
use_locking(*
T0	*
_class
loc:@eval_step*
_output_shapes
: 
U
readIdentity	eval_step
^AssignAdd^group_deps*
_output_shapes
: *
T0	
;
IdentityIdentityread*
T0	*
_output_shapes
: 
?
initNoOp1^dnn/hiddenlayer_0/batchnorm_0/beta/part_0/Assign2^dnn/hiddenlayer_0/batchnorm_0/gamma/part_0/Assign1^dnn/hiddenlayer_0/batchnorm_0/moving_mean/Assign5^dnn/hiddenlayer_0/batchnorm_0/moving_variance/Assign%^dnn/hiddenlayer_0/bias/part_0/Assign'^dnn/hiddenlayer_0/kernel/part_0/Assign1^dnn/hiddenlayer_1/batchnorm_1/beta/part_0/Assign2^dnn/hiddenlayer_1/batchnorm_1/gamma/part_0/Assign1^dnn/hiddenlayer_1/batchnorm_1/moving_mean/Assign5^dnn/hiddenlayer_1/batchnorm_1/moving_variance/Assign%^dnn/hiddenlayer_1/bias/part_0/Assign'^dnn/hiddenlayer_1/kernel/part_0/Assign1^dnn/hiddenlayer_2/batchnorm_2/beta/part_0/Assign2^dnn/hiddenlayer_2/batchnorm_2/gamma/part_0/Assign1^dnn/hiddenlayer_2/batchnorm_2/moving_mean/Assign5^dnn/hiddenlayer_2/batchnorm_2/moving_variance/Assign%^dnn/hiddenlayer_2/bias/part_0/Assign'^dnn/hiddenlayer_2/kernel/part_0/Assigna^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Assignc^dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Assign]^dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Assignd^dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Assigna^dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Assign^dnn/logits/bias/part_0/Assign ^dnn/logits/kernel/part_0/Assign^global_step/Assign

init_1NoOp
$
group_deps_1NoOp^init^init_1
?
4report_uninitialized_variables/IsVariableInitializedIsVariableInitializedglobal_step*
_class
loc:@global_step*
dtype0	*
_output_shapes
: 
?
6report_uninitialized_variables/IsVariableInitialized_1IsVariableInitializedYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
6report_uninitialized_variables/IsVariableInitialized_2IsVariableInitialized[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
6report_uninitialized_variables/IsVariableInitialized_3IsVariableInitializedUdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
6report_uninitialized_variables/IsVariableInitialized_4IsVariableInitialized\dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
6report_uninitialized_variables/IsVariableInitialized_5IsVariableInitializedYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: *l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0
?
1report_uninitialized_variables/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_0/kernel/part_0*
_output_shapes
: 
?
3report_uninitialized_variables/VarIsInitializedOp_1VarIsInitializedOpdnn/hiddenlayer_0/bias/part_0*
_output_shapes
: 
?
3report_uninitialized_variables/VarIsInitializedOp_2VarIsInitializedOp*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*
_output_shapes
: 
?
3report_uninitialized_variables/VarIsInitializedOp_3VarIsInitializedOp)dnn/hiddenlayer_0/batchnorm_0/beta/part_0*
_output_shapes
: 
?
3report_uninitialized_variables/VarIsInitializedOp_4VarIsInitializedOp)dnn/hiddenlayer_0/batchnorm_0/moving_mean*
_output_shapes
: 
?
3report_uninitialized_variables/VarIsInitializedOp_5VarIsInitializedOp-dnn/hiddenlayer_0/batchnorm_0/moving_variance*
_output_shapes
: 
?
3report_uninitialized_variables/VarIsInitializedOp_6VarIsInitializedOpdnn/hiddenlayer_1/kernel/part_0*
_output_shapes
: 
?
3report_uninitialized_variables/VarIsInitializedOp_7VarIsInitializedOpdnn/hiddenlayer_1/bias/part_0*
_output_shapes
: 
?
3report_uninitialized_variables/VarIsInitializedOp_8VarIsInitializedOp*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*
_output_shapes
: 
?
3report_uninitialized_variables/VarIsInitializedOp_9VarIsInitializedOp)dnn/hiddenlayer_1/batchnorm_1/beta/part_0*
_output_shapes
: 
?
4report_uninitialized_variables/VarIsInitializedOp_10VarIsInitializedOp)dnn/hiddenlayer_1/batchnorm_1/moving_mean*
_output_shapes
: 
?
4report_uninitialized_variables/VarIsInitializedOp_11VarIsInitializedOp-dnn/hiddenlayer_1/batchnorm_1/moving_variance*
_output_shapes
: 
?
4report_uninitialized_variables/VarIsInitializedOp_12VarIsInitializedOpdnn/hiddenlayer_2/kernel/part_0*
_output_shapes
: 
?
4report_uninitialized_variables/VarIsInitializedOp_13VarIsInitializedOpdnn/hiddenlayer_2/bias/part_0*
_output_shapes
: 
?
4report_uninitialized_variables/VarIsInitializedOp_14VarIsInitializedOp*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0*
_output_shapes
: 
?
4report_uninitialized_variables/VarIsInitializedOp_15VarIsInitializedOp)dnn/hiddenlayer_2/batchnorm_2/beta/part_0*
_output_shapes
: 
?
4report_uninitialized_variables/VarIsInitializedOp_16VarIsInitializedOp)dnn/hiddenlayer_2/batchnorm_2/moving_mean*
_output_shapes
: 
?
4report_uninitialized_variables/VarIsInitializedOp_17VarIsInitializedOp-dnn/hiddenlayer_2/batchnorm_2/moving_variance*
_output_shapes
: 
|
4report_uninitialized_variables/VarIsInitializedOp_18VarIsInitializedOpdnn/logits/kernel/part_0*
_output_shapes
: 
z
4report_uninitialized_variables/VarIsInitializedOp_19VarIsInitializedOpdnn/logits/bias/part_0*
_output_shapes
: 
?
6report_uninitialized_variables/IsVariableInitialized_6IsVariableInitialized
mean/total*
_class
loc:@mean/total*
dtype0*
_output_shapes
: 
?
6report_uninitialized_variables/IsVariableInitialized_7IsVariableInitialized
mean/count*
_class
loc:@mean/count*
dtype0*
_output_shapes
: 
?
6report_uninitialized_variables/IsVariableInitialized_8IsVariableInitializedprediction/mean/total*(
_class
loc:@prediction/mean/total*
dtype0*
_output_shapes
: 
?
6report_uninitialized_variables/IsVariableInitialized_9IsVariableInitializedprediction/mean/count*(
_class
loc:@prediction/mean/count*
dtype0*
_output_shapes
: 
?
7report_uninitialized_variables/IsVariableInitialized_10IsVariableInitializedmean_1/total*
_class
loc:@mean_1/total*
dtype0*
_output_shapes
: 
?
7report_uninitialized_variables/IsVariableInitialized_11IsVariableInitializedmean_1/count*
_class
loc:@mean_1/count*
dtype0*
_output_shapes
: 
?
7report_uninitialized_variables/IsVariableInitialized_12IsVariableInitializedmean_2/total*
_class
loc:@mean_2/total*
dtype0*
_output_shapes
: 
?
7report_uninitialized_variables/IsVariableInitialized_13IsVariableInitializedmean_2/count*
_class
loc:@mean_2/count*
dtype0*
_output_shapes
: 
?
7report_uninitialized_variables/IsVariableInitialized_14IsVariableInitialized	eval_step*
_class
loc:@eval_step*
dtype0	*
_output_shapes
: 
?
$report_uninitialized_variables/stackPack4report_uninitialized_variables/IsVariableInitialized6report_uninitialized_variables/IsVariableInitialized_16report_uninitialized_variables/IsVariableInitialized_26report_uninitialized_variables/IsVariableInitialized_36report_uninitialized_variables/IsVariableInitialized_46report_uninitialized_variables/IsVariableInitialized_51report_uninitialized_variables/VarIsInitializedOp3report_uninitialized_variables/VarIsInitializedOp_13report_uninitialized_variables/VarIsInitializedOp_23report_uninitialized_variables/VarIsInitializedOp_33report_uninitialized_variables/VarIsInitializedOp_43report_uninitialized_variables/VarIsInitializedOp_53report_uninitialized_variables/VarIsInitializedOp_63report_uninitialized_variables/VarIsInitializedOp_73report_uninitialized_variables/VarIsInitializedOp_83report_uninitialized_variables/VarIsInitializedOp_94report_uninitialized_variables/VarIsInitializedOp_104report_uninitialized_variables/VarIsInitializedOp_114report_uninitialized_variables/VarIsInitializedOp_124report_uninitialized_variables/VarIsInitializedOp_134report_uninitialized_variables/VarIsInitializedOp_144report_uninitialized_variables/VarIsInitializedOp_154report_uninitialized_variables/VarIsInitializedOp_164report_uninitialized_variables/VarIsInitializedOp_174report_uninitialized_variables/VarIsInitializedOp_184report_uninitialized_variables/VarIsInitializedOp_196report_uninitialized_variables/IsVariableInitialized_66report_uninitialized_variables/IsVariableInitialized_76report_uninitialized_variables/IsVariableInitialized_86report_uninitialized_variables/IsVariableInitialized_97report_uninitialized_variables/IsVariableInitialized_107report_uninitialized_variables/IsVariableInitialized_117report_uninitialized_variables/IsVariableInitialized_127report_uninitialized_variables/IsVariableInitialized_137report_uninitialized_variables/IsVariableInitialized_14"/device:CPU:0*
T0
*

axis *
N#*
_output_shapes
:#
?
)report_uninitialized_variables/LogicalNot
LogicalNot$report_uninitialized_variables/stack"/device:CPU:0*
_output_shapes
:#
?
$report_uninitialized_variables/ConstConst"/device:CPU:0*?

value?
B?
#Bglobal_stepBYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0B[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0BUdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0B\dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0BYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0Bdnn/hiddenlayer_0/kernel/part_0Bdnn/hiddenlayer_0/bias/part_0B*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0B)dnn/hiddenlayer_0/batchnorm_0/beta/part_0B)dnn/hiddenlayer_0/batchnorm_0/moving_meanB-dnn/hiddenlayer_0/batchnorm_0/moving_varianceBdnn/hiddenlayer_1/kernel/part_0Bdnn/hiddenlayer_1/bias/part_0B*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0B)dnn/hiddenlayer_1/batchnorm_1/beta/part_0B)dnn/hiddenlayer_1/batchnorm_1/moving_meanB-dnn/hiddenlayer_1/batchnorm_1/moving_varianceBdnn/hiddenlayer_2/kernel/part_0Bdnn/hiddenlayer_2/bias/part_0B*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0B)dnn/hiddenlayer_2/batchnorm_2/beta/part_0B)dnn/hiddenlayer_2/batchnorm_2/moving_meanB-dnn/hiddenlayer_2/batchnorm_2/moving_varianceBdnn/logits/kernel/part_0Bdnn/logits/bias/part_0B
mean/totalB
mean/countBprediction/mean/totalBprediction/mean/countBmean_1/totalBmean_1/countBmean_2/totalBmean_2/countB	eval_step*
dtype0*
_output_shapes
:#
?
1report_uninitialized_variables/boolean_mask/ShapeConst"/device:CPU:0*
valueB:#*
dtype0*
_output_shapes
:
?
?report_uninitialized_variables/boolean_mask/strided_slice/stackConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:
?
Areport_uninitialized_variables/boolean_mask/strided_slice/stack_1Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
?
Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
?
9report_uninitialized_variables/boolean_mask/strided_sliceStridedSlice1report_uninitialized_variables/boolean_mask/Shape?report_uninitialized_variables/boolean_mask/strided_slice/stackAreport_uninitialized_variables/boolean_mask/strided_slice/stack_1Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2"/device:CPU:0*
shrink_axis_mask *
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
:*
Index0*
T0
?
Breport_uninitialized_variables/boolean_mask/Prod/reduction_indicesConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:
?
0report_uninitialized_variables/boolean_mask/ProdProd9report_uninitialized_variables/boolean_mask/strided_sliceBreport_uninitialized_variables/boolean_mask/Prod/reduction_indices"/device:CPU:0*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 
?
3report_uninitialized_variables/boolean_mask/Shape_1Const"/device:CPU:0*
valueB:#*
dtype0*
_output_shapes
:
?
Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:
?
Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Const"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB: 
?
Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
?
;report_uninitialized_variables/boolean_mask/strided_slice_1StridedSlice3report_uninitialized_variables/boolean_mask/Shape_1Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackCreport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2"/device:CPU:0*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask 
?
3report_uninitialized_variables/boolean_mask/Shape_2Const"/device:CPU:0*
valueB:#*
dtype0*
_output_shapes
:
?
Areport_uninitialized_variables/boolean_mask/strided_slice_2/stackConst"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
?
Creport_uninitialized_variables/boolean_mask/strided_slice_2/stack_1Const"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:
?
Creport_uninitialized_variables/boolean_mask/strided_slice_2/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
?
;report_uninitialized_variables/boolean_mask/strided_slice_2StridedSlice3report_uninitialized_variables/boolean_mask/Shape_2Areport_uninitialized_variables/boolean_mask/strided_slice_2/stackCreport_uninitialized_variables/boolean_mask/strided_slice_2/stack_1Creport_uninitialized_variables/boolean_mask/strided_slice_2/stack_2"/device:CPU:0*
T0*
Index0*
shrink_axis_mask *
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask*
_output_shapes
: 
?
;report_uninitialized_variables/boolean_mask/concat/values_1Pack0report_uninitialized_variables/boolean_mask/Prod"/device:CPU:0*
T0*

axis *
N*
_output_shapes
:
?
7report_uninitialized_variables/boolean_mask/concat/axisConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
?
2report_uninitialized_variables/boolean_mask/concatConcatV2;report_uninitialized_variables/boolean_mask/strided_slice_1;report_uninitialized_variables/boolean_mask/concat/values_1;report_uninitialized_variables/boolean_mask/strided_slice_27report_uninitialized_variables/boolean_mask/concat/axis"/device:CPU:0*
T0*
N*
_output_shapes
:*

Tidx0
?
3report_uninitialized_variables/boolean_mask/ReshapeReshape$report_uninitialized_variables/Const2report_uninitialized_variables/boolean_mask/concat"/device:CPU:0*
T0*
Tshape0*
_output_shapes
:#
?
;report_uninitialized_variables/boolean_mask/Reshape_1/shapeConst"/device:CPU:0*
valueB:
?????????*
dtype0*
_output_shapes
:
?
5report_uninitialized_variables/boolean_mask/Reshape_1Reshape)report_uninitialized_variables/LogicalNot;report_uninitialized_variables/boolean_mask/Reshape_1/shape"/device:CPU:0*
T0
*
Tshape0*
_output_shapes
:#
?
1report_uninitialized_variables/boolean_mask/WhereWhere5report_uninitialized_variables/boolean_mask/Reshape_1"/device:CPU:0*
T0
*'
_output_shapes
:?????????
?
3report_uninitialized_variables/boolean_mask/SqueezeSqueeze1report_uninitialized_variables/boolean_mask/Where"/device:CPU:0*
squeeze_dims
*
T0	*#
_output_shapes
:?????????
?
9report_uninitialized_variables/boolean_mask/GatherV2/axisConst"/device:CPU:0*
dtype0*
_output_shapes
: *
value	B : 
?
4report_uninitialized_variables/boolean_mask/GatherV2GatherV23report_uninitialized_variables/boolean_mask/Reshape3report_uninitialized_variables/boolean_mask/Squeeze9report_uninitialized_variables/boolean_mask/GatherV2/axis"/device:CPU:0*
Tindices0	*
Tparams0*#
_output_shapes
:?????????*
Taxis0
v
$report_uninitialized_resources/ConstConst"/device:CPU:0*
valueB *
dtype0*
_output_shapes
: 
M
concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
?
concatConcatV24report_uninitialized_variables/boolean_mask/GatherV2$report_uninitialized_resources/Constconcat/axis*
T0*
N*#
_output_shapes
:?????????*

Tidx0
?
6report_uninitialized_variables_1/IsVariableInitializedIsVariableInitializedglobal_step*
_class
loc:@global_step*
dtype0	*
_output_shapes
: 
?
8report_uninitialized_variables_1/IsVariableInitialized_1IsVariableInitializedYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
8report_uninitialized_variables_1/IsVariableInitialized_2IsVariableInitialized[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
8report_uninitialized_variables_1/IsVariableInitialized_3IsVariableInitializedUdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
8report_uninitialized_variables_1/IsVariableInitialized_4IsVariableInitialized\dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: *o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0
?
8report_uninitialized_variables_1/IsVariableInitialized_5IsVariableInitializedYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
3report_uninitialized_variables_1/VarIsInitializedOpVarIsInitializedOpdnn/hiddenlayer_0/kernel/part_0*
_output_shapes
: 
?
5report_uninitialized_variables_1/VarIsInitializedOp_1VarIsInitializedOpdnn/hiddenlayer_0/bias/part_0*
_output_shapes
: 
?
5report_uninitialized_variables_1/VarIsInitializedOp_2VarIsInitializedOp*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*
_output_shapes
: 
?
5report_uninitialized_variables_1/VarIsInitializedOp_3VarIsInitializedOp)dnn/hiddenlayer_0/batchnorm_0/beta/part_0*
_output_shapes
: 
?
5report_uninitialized_variables_1/VarIsInitializedOp_4VarIsInitializedOp)dnn/hiddenlayer_0/batchnorm_0/moving_mean*
_output_shapes
: 
?
5report_uninitialized_variables_1/VarIsInitializedOp_5VarIsInitializedOp-dnn/hiddenlayer_0/batchnorm_0/moving_variance*
_output_shapes
: 
?
5report_uninitialized_variables_1/VarIsInitializedOp_6VarIsInitializedOpdnn/hiddenlayer_1/kernel/part_0*
_output_shapes
: 
?
5report_uninitialized_variables_1/VarIsInitializedOp_7VarIsInitializedOpdnn/hiddenlayer_1/bias/part_0*
_output_shapes
: 
?
5report_uninitialized_variables_1/VarIsInitializedOp_8VarIsInitializedOp*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*
_output_shapes
: 
?
5report_uninitialized_variables_1/VarIsInitializedOp_9VarIsInitializedOp)dnn/hiddenlayer_1/batchnorm_1/beta/part_0*
_output_shapes
: 
?
6report_uninitialized_variables_1/VarIsInitializedOp_10VarIsInitializedOp)dnn/hiddenlayer_1/batchnorm_1/moving_mean*
_output_shapes
: 
?
6report_uninitialized_variables_1/VarIsInitializedOp_11VarIsInitializedOp-dnn/hiddenlayer_1/batchnorm_1/moving_variance*
_output_shapes
: 
?
6report_uninitialized_variables_1/VarIsInitializedOp_12VarIsInitializedOpdnn/hiddenlayer_2/kernel/part_0*
_output_shapes
: 
?
6report_uninitialized_variables_1/VarIsInitializedOp_13VarIsInitializedOpdnn/hiddenlayer_2/bias/part_0*
_output_shapes
: 
?
6report_uninitialized_variables_1/VarIsInitializedOp_14VarIsInitializedOp*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0*
_output_shapes
: 
?
6report_uninitialized_variables_1/VarIsInitializedOp_15VarIsInitializedOp)dnn/hiddenlayer_2/batchnorm_2/beta/part_0*
_output_shapes
: 
?
6report_uninitialized_variables_1/VarIsInitializedOp_16VarIsInitializedOp)dnn/hiddenlayer_2/batchnorm_2/moving_mean*
_output_shapes
: 
?
6report_uninitialized_variables_1/VarIsInitializedOp_17VarIsInitializedOp-dnn/hiddenlayer_2/batchnorm_2/moving_variance*
_output_shapes
: 
~
6report_uninitialized_variables_1/VarIsInitializedOp_18VarIsInitializedOpdnn/logits/kernel/part_0*
_output_shapes
: 
|
6report_uninitialized_variables_1/VarIsInitializedOp_19VarIsInitializedOpdnn/logits/bias/part_0*
_output_shapes
: 
?
&report_uninitialized_variables_1/stackPack6report_uninitialized_variables_1/IsVariableInitialized8report_uninitialized_variables_1/IsVariableInitialized_18report_uninitialized_variables_1/IsVariableInitialized_28report_uninitialized_variables_1/IsVariableInitialized_38report_uninitialized_variables_1/IsVariableInitialized_48report_uninitialized_variables_1/IsVariableInitialized_53report_uninitialized_variables_1/VarIsInitializedOp5report_uninitialized_variables_1/VarIsInitializedOp_15report_uninitialized_variables_1/VarIsInitializedOp_25report_uninitialized_variables_1/VarIsInitializedOp_35report_uninitialized_variables_1/VarIsInitializedOp_45report_uninitialized_variables_1/VarIsInitializedOp_55report_uninitialized_variables_1/VarIsInitializedOp_65report_uninitialized_variables_1/VarIsInitializedOp_75report_uninitialized_variables_1/VarIsInitializedOp_85report_uninitialized_variables_1/VarIsInitializedOp_96report_uninitialized_variables_1/VarIsInitializedOp_106report_uninitialized_variables_1/VarIsInitializedOp_116report_uninitialized_variables_1/VarIsInitializedOp_126report_uninitialized_variables_1/VarIsInitializedOp_136report_uninitialized_variables_1/VarIsInitializedOp_146report_uninitialized_variables_1/VarIsInitializedOp_156report_uninitialized_variables_1/VarIsInitializedOp_166report_uninitialized_variables_1/VarIsInitializedOp_176report_uninitialized_variables_1/VarIsInitializedOp_186report_uninitialized_variables_1/VarIsInitializedOp_19"/device:CPU:0*
T0
*

axis *
N*
_output_shapes
:
?
+report_uninitialized_variables_1/LogicalNot
LogicalNot&report_uninitialized_variables_1/stack"/device:CPU:0*
_output_shapes
:
?

&report_uninitialized_variables_1/ConstConst"/device:CPU:0*?	
value?	B?	Bglobal_stepBYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0B[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0BUdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0B\dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0BYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0Bdnn/hiddenlayer_0/kernel/part_0Bdnn/hiddenlayer_0/bias/part_0B*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0B)dnn/hiddenlayer_0/batchnorm_0/beta/part_0B)dnn/hiddenlayer_0/batchnorm_0/moving_meanB-dnn/hiddenlayer_0/batchnorm_0/moving_varianceBdnn/hiddenlayer_1/kernel/part_0Bdnn/hiddenlayer_1/bias/part_0B*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0B)dnn/hiddenlayer_1/batchnorm_1/beta/part_0B)dnn/hiddenlayer_1/batchnorm_1/moving_meanB-dnn/hiddenlayer_1/batchnorm_1/moving_varianceBdnn/hiddenlayer_2/kernel/part_0Bdnn/hiddenlayer_2/bias/part_0B*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0B)dnn/hiddenlayer_2/batchnorm_2/beta/part_0B)dnn/hiddenlayer_2/batchnorm_2/moving_meanB-dnn/hiddenlayer_2/batchnorm_2/moving_varianceBdnn/logits/kernel/part_0Bdnn/logits/bias/part_0*
dtype0*
_output_shapes
:
?
3report_uninitialized_variables_1/boolean_mask/ShapeConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:
?
Areport_uninitialized_variables_1/boolean_mask/strided_slice/stackConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:
?
Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
?
Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
?
;report_uninitialized_variables_1/boolean_mask/strided_sliceStridedSlice3report_uninitialized_variables_1/boolean_mask/ShapeAreport_uninitialized_variables_1/boolean_mask/strided_slice/stackCreport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2"/device:CPU:0*
end_mask *
_output_shapes
:*
T0*
Index0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask 
?
Dreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB: 
?
2report_uninitialized_variables_1/boolean_mask/ProdProd;report_uninitialized_variables_1/boolean_mask/strided_sliceDreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indices"/device:CPU:0*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 
?
5report_uninitialized_variables_1/boolean_mask/Shape_1Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
?
Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:
?
Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Const"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:
?
Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
?
=report_uninitialized_variables_1/boolean_mask/strided_slice_1StridedSlice5report_uninitialized_variables_1/boolean_mask/Shape_1Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackEreport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2"/device:CPU:0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
?
5report_uninitialized_variables_1/boolean_mask/Shape_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
?
Creport_uninitialized_variables_1/boolean_mask/strided_slice_2/stackConst"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
?
Ereport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_1Const"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:
?
Ereport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
?
=report_uninitialized_variables_1/boolean_mask/strided_slice_2StridedSlice5report_uninitialized_variables_1/boolean_mask/Shape_2Creport_uninitialized_variables_1/boolean_mask/strided_slice_2/stackEreport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_1Ereport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_2"/device:CPU:0*
T0*
Index0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask*
_output_shapes
: 
?
=report_uninitialized_variables_1/boolean_mask/concat/values_1Pack2report_uninitialized_variables_1/boolean_mask/Prod"/device:CPU:0*
T0*

axis *
N*
_output_shapes
:
?
9report_uninitialized_variables_1/boolean_mask/concat/axisConst"/device:CPU:0*
dtype0*
_output_shapes
: *
value	B : 
?
4report_uninitialized_variables_1/boolean_mask/concatConcatV2=report_uninitialized_variables_1/boolean_mask/strided_slice_1=report_uninitialized_variables_1/boolean_mask/concat/values_1=report_uninitialized_variables_1/boolean_mask/strided_slice_29report_uninitialized_variables_1/boolean_mask/concat/axis"/device:CPU:0*
N*
_output_shapes
:*

Tidx0*
T0
?
5report_uninitialized_variables_1/boolean_mask/ReshapeReshape&report_uninitialized_variables_1/Const4report_uninitialized_variables_1/boolean_mask/concat"/device:CPU:0*
T0*
Tshape0*
_output_shapes
:
?
=report_uninitialized_variables_1/boolean_mask/Reshape_1/shapeConst"/device:CPU:0*
valueB:
?????????*
dtype0*
_output_shapes
:
?
7report_uninitialized_variables_1/boolean_mask/Reshape_1Reshape+report_uninitialized_variables_1/LogicalNot=report_uninitialized_variables_1/boolean_mask/Reshape_1/shape"/device:CPU:0*
T0
*
Tshape0*
_output_shapes
:
?
3report_uninitialized_variables_1/boolean_mask/WhereWhere7report_uninitialized_variables_1/boolean_mask/Reshape_1"/device:CPU:0*
T0
*'
_output_shapes
:?????????
?
5report_uninitialized_variables_1/boolean_mask/SqueezeSqueeze3report_uninitialized_variables_1/boolean_mask/Where"/device:CPU:0*
squeeze_dims
*
T0	*#
_output_shapes
:?????????
?
;report_uninitialized_variables_1/boolean_mask/GatherV2/axisConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
?
6report_uninitialized_variables_1/boolean_mask/GatherV2GatherV25report_uninitialized_variables_1/boolean_mask/Reshape5report_uninitialized_variables_1/boolean_mask/Squeeze;report_uninitialized_variables_1/boolean_mask/GatherV2/axis"/device:CPU:0*
Tparams0*#
_output_shapes
:?????????*
Taxis0*
Tindices0	
x
&report_uninitialized_resources_1/ConstConst"/device:CPU:0*
valueB *
dtype0*
_output_shapes
: 
O
concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
concat_1ConcatV26report_uninitialized_variables_1/boolean_mask/GatherV2&report_uninitialized_resources_1/Constconcat_1/axis*
N*#
_output_shapes
:?????????*

Tidx0*
T0
?
init_2NoOp^eval_step/Assign^mean/count/Assign^mean/total/Assign^mean_1/count/Assign^mean_1/total/Assign^mean_2/count/Assign^mean_2/total/Assign^prediction/mean/count/Assign^prediction/mean/total/Assign
?
init_all_tablesNoOpj^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/hash_table/table_initn^dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/hash_table/table_initb^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/hash_table/table_initp^dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/hash_table/table_initj^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_table/table_init

init_3NoOp
8
group_deps_2NoOp^init_2^init_3^init_all_tables
?
Merge/MergeSummaryMergeSummarylearning_rate-dnn/dnn/hiddenlayer_0/fraction_of_zero_values dnn/dnn/hiddenlayer_0/activation-dnn/dnn/hiddenlayer_1/fraction_of_zero_values dnn/dnn/hiddenlayer_1/activation-dnn/dnn/hiddenlayer_2/fraction_of_zero_values dnn/dnn/hiddenlayer_2/activation&dnn/dnn/logits/fraction_of_zero_valuesdnn/dnn/logits/activation*
N	*
_output_shapes
: 
Y
save/filename/inputConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
n
save/filenamePlaceholderWithDefaultsave/filename/input*
dtype0*
_output_shapes
: *
shape: 
e

save/ConstPlaceholderWithDefaultsave/filename*
dtype0*
_output_shapes
: *
shape: 
~
save/Read/ReadVariableOpReadVariableOp)dnn/hiddenlayer_0/batchnorm_0/beta/part_0*
dtype0*
_output_shapes
: 
X
save/IdentityIdentitysave/Read/ReadVariableOp*
T0*
_output_shapes
: 
^
save/Identity_1Identitysave/Identity"/device:CPU:0*
T0*
_output_shapes
: 
?
save/Read_1/ReadVariableOpReadVariableOp*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*
dtype0*
_output_shapes
: 
\
save/Identity_2Identitysave/Read_1/ReadVariableOp*
T0*
_output_shapes
: 
`
save/Identity_3Identitysave/Identity_2"/device:CPU:0*
_output_shapes
: *
T0
t
save/Read_2/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes
: 
\
save/Identity_4Identitysave/Read_2/ReadVariableOp*
T0*
_output_shapes
: 
`
save/Identity_5Identitysave/Identity_4"/device:CPU:0*
_output_shapes
: *
T0
z
save/Read_3/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes

: 
`
save/Identity_6Identitysave/Read_3/ReadVariableOp*
_output_shapes

: *
T0
d
save/Identity_7Identitysave/Identity_6"/device:CPU:0*
T0*
_output_shapes

: 
?
save/Read_4/ReadVariableOpReadVariableOp)dnn/hiddenlayer_1/batchnorm_1/beta/part_0*
dtype0*
_output_shapes
:
\
save/Identity_8Identitysave/Read_4/ReadVariableOp*
T0*
_output_shapes
:
`
save/Identity_9Identitysave/Identity_8"/device:CPU:0*
T0*
_output_shapes
:
?
save/Read_5/ReadVariableOpReadVariableOp*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*
dtype0*
_output_shapes
:
]
save/Identity_10Identitysave/Read_5/ReadVariableOp*
T0*
_output_shapes
:
b
save/Identity_11Identitysave/Identity_10"/device:CPU:0*
T0*
_output_shapes
:
t
save/Read_6/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0*
dtype0*
_output_shapes
:
]
save/Identity_12Identitysave/Read_6/ReadVariableOp*
_output_shapes
:*
T0
b
save/Identity_13Identitysave/Identity_12"/device:CPU:0*
T0*
_output_shapes
:
z
save/Read_7/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes

: 
a
save/Identity_14Identitysave/Read_7/ReadVariableOp*
_output_shapes

: *
T0
f
save/Identity_15Identitysave/Identity_14"/device:CPU:0*
T0*
_output_shapes

: 
?
save/Read_8/ReadVariableOpReadVariableOp)dnn/hiddenlayer_2/batchnorm_2/beta/part_0*
dtype0*
_output_shapes
:
]
save/Identity_16Identitysave/Read_8/ReadVariableOp*
T0*
_output_shapes
:
b
save/Identity_17Identitysave/Identity_16"/device:CPU:0*
T0*
_output_shapes
:
?
save/Read_9/ReadVariableOpReadVariableOp*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0*
dtype0*
_output_shapes
:
]
save/Identity_18Identitysave/Read_9/ReadVariableOp*
_output_shapes
:*
T0
b
save/Identity_19Identitysave/Identity_18"/device:CPU:0*
T0*
_output_shapes
:
u
save/Read_10/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0*
dtype0*
_output_shapes
:
^
save/Identity_20Identitysave/Read_10/ReadVariableOp*
T0*
_output_shapes
:
b
save/Identity_21Identitysave/Identity_20"/device:CPU:0*
_output_shapes
:*
T0
{
save/Read_11/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes

:
b
save/Identity_22Identitysave/Read_11/ReadVariableOp*
T0*
_output_shapes

:
f
save/Identity_23Identitysave/Identity_22"/device:CPU:0*
T0*
_output_shapes

:
n
save/Read_12/ReadVariableOpReadVariableOpdnn/logits/bias/part_0*
dtype0*
_output_shapes
:
^
save/Identity_24Identitysave/Read_12/ReadVariableOp*
T0*
_output_shapes
:
b
save/Identity_25Identitysave/Identity_24"/device:CPU:0*
_output_shapes
:*
T0
t
save/Read_13/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0*
dtype0*
_output_shapes

:
b
save/Identity_26Identitysave/Read_13/ReadVariableOp*
T0*
_output_shapes

:
f
save/Identity_27Identitysave/Identity_26"/device:CPU:0*
T0*
_output_shapes

:
?
save/StringJoin/inputs_1Const*
dtype0*
_output_shapes
: *<
value3B1 B+_temp_681207dc7fd241d7affd68d46faf7ea3/part
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
Q
save/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
k
save/ShardedFilename/shardConst"/device:CPU:0*
dtype0*
_output_shapes
: *
value	B : 
?
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
?
save/SaveV2/tensor_namesConst"/device:CPU:0*?
value?B?B)dnn/hiddenlayer_0/batchnorm_0/moving_meanB-dnn/hiddenlayer_0/batchnorm_0/moving_varianceB)dnn/hiddenlayer_1/batchnorm_1/moving_meanB-dnn/hiddenlayer_1/batchnorm_1/moving_varianceB)dnn/hiddenlayer_2/batchnorm_2/moving_meanB-dnn/hiddenlayer_2/batchnorm_2/moving_varianceBRdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weightsBTdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weightsBNdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weightsBUdnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weightsBRdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weightsBglobal_step*
dtype0*
_output_shapes
:
?
save/SaveV2/shape_and_slicesConst"/device:CPU:0*d
value[BYB B B B B B B3 2 0,3:0,2B3 2 0,3:0,2B2 2 0,2:0,2B2 2 0,2:0,2B12 4 0,12:0,4B *
dtype0*
_output_shapes
:
?
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slices=dnn/hiddenlayer_0/batchnorm_0/moving_mean/Read/ReadVariableOpAdnn/hiddenlayer_0/batchnorm_0/moving_variance/Read/ReadVariableOp=dnn/hiddenlayer_1/batchnorm_1/moving_mean/Read/ReadVariableOpAdnn/hiddenlayer_1/batchnorm_1/moving_variance/Read/ReadVariableOp=dnn/hiddenlayer_2/batchnorm_2/moving_mean/Read/ReadVariableOpAdnn/hiddenlayer_2/batchnorm_2/moving_variance/Read/ReadVariableOp^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/read`dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/readZdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/readadnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/read^dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/readglobal_step"/device:CPU:0*
dtypes
2	
?
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
m
save/ShardedFilename_1/shardConst"/device:CPU:0*
value	B :*
dtype0*
_output_shapes
: 
?
save/ShardedFilename_1ShardedFilenamesave/StringJoinsave/ShardedFilename_1/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
?
save/Read_14/ReadVariableOpReadVariableOp)dnn/hiddenlayer_0/batchnorm_0/beta/part_0"/device:CPU:0*
dtype0*
_output_shapes
: 
m
save/Identity_28Identitysave/Read_14/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
: 
b
save/Identity_29Identitysave/Identity_28"/device:CPU:0*
T0*
_output_shapes
: 
?
save/Read_15/ReadVariableOpReadVariableOp*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0"/device:CPU:0*
dtype0*
_output_shapes
: 
m
save/Identity_30Identitysave/Read_15/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
: 
b
save/Identity_31Identitysave/Identity_30"/device:CPU:0*
_output_shapes
: *
T0
?
save/Read_16/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes
: 
m
save/Identity_32Identitysave/Read_16/ReadVariableOp"/device:CPU:0*
_output_shapes
: *
T0
b
save/Identity_33Identitysave/Identity_32"/device:CPU:0*
T0*
_output_shapes
: 
?
save/Read_17/ReadVariableOpReadVariableOpdnn/hiddenlayer_0/kernel/part_0"/device:CPU:0*
dtype0*
_output_shapes

: 
q
save/Identity_34Identitysave/Read_17/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

: 
f
save/Identity_35Identitysave/Identity_34"/device:CPU:0*
T0*
_output_shapes

: 
?
save/Read_18/ReadVariableOpReadVariableOp)dnn/hiddenlayer_1/batchnorm_1/beta/part_0"/device:CPU:0*
dtype0*
_output_shapes
:
m
save/Identity_36Identitysave/Read_18/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:
b
save/Identity_37Identitysave/Identity_36"/device:CPU:0*
T0*
_output_shapes
:
?
save/Read_19/ReadVariableOpReadVariableOp*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0"/device:CPU:0*
dtype0*
_output_shapes
:
m
save/Identity_38Identitysave/Read_19/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:
b
save/Identity_39Identitysave/Identity_38"/device:CPU:0*
T0*
_output_shapes
:
?
save/Read_20/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes
:
m
save/Identity_40Identitysave/Read_20/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:
b
save/Identity_41Identitysave/Identity_40"/device:CPU:0*
_output_shapes
:*
T0
?
save/Read_21/ReadVariableOpReadVariableOpdnn/hiddenlayer_1/kernel/part_0"/device:CPU:0*
dtype0*
_output_shapes

: 
q
save/Identity_42Identitysave/Read_21/ReadVariableOp"/device:CPU:0*
_output_shapes

: *
T0
f
save/Identity_43Identitysave/Identity_42"/device:CPU:0*
T0*
_output_shapes

: 
?
save/Read_22/ReadVariableOpReadVariableOp)dnn/hiddenlayer_2/batchnorm_2/beta/part_0"/device:CPU:0*
dtype0*
_output_shapes
:
m
save/Identity_44Identitysave/Read_22/ReadVariableOp"/device:CPU:0*
_output_shapes
:*
T0
b
save/Identity_45Identitysave/Identity_44"/device:CPU:0*
_output_shapes
:*
T0
?
save/Read_23/ReadVariableOpReadVariableOp*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0"/device:CPU:0*
dtype0*
_output_shapes
:
m
save/Identity_46Identitysave/Read_23/ReadVariableOp"/device:CPU:0*
_output_shapes
:*
T0
b
save/Identity_47Identitysave/Identity_46"/device:CPU:0*
_output_shapes
:*
T0
?
save/Read_24/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes
:
m
save/Identity_48Identitysave/Read_24/ReadVariableOp"/device:CPU:0*
_output_shapes
:*
T0
b
save/Identity_49Identitysave/Identity_48"/device:CPU:0*
T0*
_output_shapes
:
?
save/Read_25/ReadVariableOpReadVariableOpdnn/hiddenlayer_2/kernel/part_0"/device:CPU:0*
dtype0*
_output_shapes

:
q
save/Identity_50Identitysave/Read_25/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:
f
save/Identity_51Identitysave/Identity_50"/device:CPU:0*
T0*
_output_shapes

:
}
save/Read_26/ReadVariableOpReadVariableOpdnn/logits/bias/part_0"/device:CPU:0*
dtype0*
_output_shapes
:
m
save/Identity_52Identitysave/Read_26/ReadVariableOp"/device:CPU:0*
_output_shapes
:*
T0
b
save/Identity_53Identitysave/Identity_52"/device:CPU:0*
T0*
_output_shapes
:
?
save/Read_27/ReadVariableOpReadVariableOpdnn/logits/kernel/part_0"/device:CPU:0*
dtype0*
_output_shapes

:
q
save/Identity_54Identitysave/Read_27/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes

:
f
save/Identity_55Identitysave/Identity_54"/device:CPU:0*
_output_shapes

:*
T0
?
save/SaveV2_1/tensor_namesConst"/device:CPU:0*?
value?B?B"dnn/hiddenlayer_0/batchnorm_0/betaB#dnn/hiddenlayer_0/batchnorm_0/gammaBdnn/hiddenlayer_0/biasBdnn/hiddenlayer_0/kernelB"dnn/hiddenlayer_1/batchnorm_1/betaB#dnn/hiddenlayer_1/batchnorm_1/gammaBdnn/hiddenlayer_1/biasBdnn/hiddenlayer_1/kernelB"dnn/hiddenlayer_2/batchnorm_2/betaB#dnn/hiddenlayer_2/batchnorm_2/gammaBdnn/hiddenlayer_2/biasBdnn/hiddenlayer_2/kernelBdnn/logits/biasBdnn/logits/kernel*
dtype0*
_output_shapes
:
?
save/SaveV2_1/shape_and_slicesConst"/device:CPU:0*?
value?B?B32 0,32B32 0,32B32 0,32B15 32 0,15:0,32B22 0,22B22 0,22B22 0,22B32 22 0,32:0,22B15 0,15B15 0,15B15 0,15B22 15 0,22:0,15B1 0,1B15 1 0,15:0,1*
dtype0*
_output_shapes
:
?
save/SaveV2_1SaveV2save/ShardedFilename_1save/SaveV2_1/tensor_namessave/SaveV2_1/shape_and_slicessave/Identity_29save/Identity_31save/Identity_33save/Identity_35save/Identity_37save/Identity_39save/Identity_41save/Identity_43save/Identity_45save/Identity_47save/Identity_49save/Identity_51save/Identity_53save/Identity_55"/device:CPU:0*
dtypes
2
?
save/control_dependency_1Identitysave/ShardedFilename_1^save/SaveV2_1"/device:CPU:0*
T0*)
_class
loc:@save/ShardedFilename_1*
_output_shapes
: 
?
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilenamesave/ShardedFilename_1^save/control_dependency^save/control_dependency_1"/device:CPU:0*
N*
_output_shapes
:*
T0*

axis 
?
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0*
delete_old_dirs(
?
save/Identity_56Identity
save/Const^save/MergeV2Checkpoints^save/control_dependency^save/control_dependency_1"/device:CPU:0*
T0*
_output_shapes
: 
?
save/RestoreV2/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*?
value?B?B)dnn/hiddenlayer_0/batchnorm_0/moving_meanB-dnn/hiddenlayer_0/batchnorm_0/moving_varianceB)dnn/hiddenlayer_1/batchnorm_1/moving_meanB-dnn/hiddenlayer_1/batchnorm_1/moving_varianceB)dnn/hiddenlayer_2/batchnorm_2/moving_meanB-dnn/hiddenlayer_2/batchnorm_2/moving_varianceBRdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weightsBTdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weightsBNdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weightsBUdnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weightsBRdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weightsBglobal_step
?
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*d
value[BYB B B B B B B3 2 0,3:0,2B3 2 0,3:0,2B2 2 0,2:0,2B2 2 0,2:0,2B12 4 0,12:0,4B 
?
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*b
_output_shapesP
N::::::::::::*
dtypes
2	
O
save/Identity_57Identitysave/RestoreV2*
T0*
_output_shapes
:
s
save/AssignVariableOpAssignVariableOp)dnn/hiddenlayer_0/batchnorm_0/moving_meansave/Identity_57*
dtype0
Q
save/Identity_58Identitysave/RestoreV2:1*
T0*
_output_shapes
:
y
save/AssignVariableOp_1AssignVariableOp-dnn/hiddenlayer_0/batchnorm_0/moving_variancesave/Identity_58*
dtype0
Q
save/Identity_59Identitysave/RestoreV2:2*
T0*
_output_shapes
:
u
save/AssignVariableOp_2AssignVariableOp)dnn/hiddenlayer_1/batchnorm_1/moving_meansave/Identity_59*
dtype0
Q
save/Identity_60Identitysave/RestoreV2:3*
T0*
_output_shapes
:
y
save/AssignVariableOp_3AssignVariableOp-dnn/hiddenlayer_1/batchnorm_1/moving_variancesave/Identity_60*
dtype0
Q
save/Identity_61Identitysave/RestoreV2:4*
T0*
_output_shapes
:
u
save/AssignVariableOp_4AssignVariableOp)dnn/hiddenlayer_2/batchnorm_2/moving_meansave/Identity_61*
dtype0
Q
save/Identity_62Identitysave/RestoreV2:5*
T0*
_output_shapes
:
y
save/AssignVariableOp_5AssignVariableOp-dnn/hiddenlayer_2/batchnorm_2/moving_variancesave/Identity_62*
dtype0
?
save/AssignAssignYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0save/RestoreV2:6*
use_locking(*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
validate_shape(*
_output_shapes

:
?
save/Assign_1Assign[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0save/RestoreV2:7*
use_locking(*
T0*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
validate_shape(*
_output_shapes

:
?
save/Assign_2AssignUdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0save/RestoreV2:8*
use_locking(*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
validate_shape(*
_output_shapes

:
?
save/Assign_3Assign\dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0save/RestoreV2:9*
use_locking(*
T0*o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
validate_shape(*
_output_shapes

:
?
save/Assign_4AssignYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0save/RestoreV2:10*
use_locking(*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
validate_shape(*
_output_shapes

:
?
save/Assign_5Assignglobal_stepsave/RestoreV2:11*
use_locking(*
T0	*
_class
loc:@global_step*
validate_shape(*
_output_shapes
: 
?
save/restore_shardNoOp^save/Assign^save/AssignVariableOp^save/AssignVariableOp_1^save/AssignVariableOp_2^save/AssignVariableOp_3^save/AssignVariableOp_4^save/AssignVariableOp_5^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5
?
save/RestoreV2_1/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*?
value?B?B"dnn/hiddenlayer_0/batchnorm_0/betaB#dnn/hiddenlayer_0/batchnorm_0/gammaBdnn/hiddenlayer_0/biasBdnn/hiddenlayer_0/kernelB"dnn/hiddenlayer_1/batchnorm_1/betaB#dnn/hiddenlayer_1/batchnorm_1/gammaBdnn/hiddenlayer_1/biasBdnn/hiddenlayer_1/kernelB"dnn/hiddenlayer_2/batchnorm_2/betaB#dnn/hiddenlayer_2/batchnorm_2/gammaBdnn/hiddenlayer_2/biasBdnn/hiddenlayer_2/kernelBdnn/logits/biasBdnn/logits/kernel
?
!save/RestoreV2_1/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*?
value?B?B32 0,32B32 0,32B32 0,32B15 32 0,15:0,32B22 0,22B22 0,22B22 0,22B32 22 0,32:0,22B15 0,15B15 0,15B15 0,15B22 15 0,22:0,15B1 0,1B15 1 0,15:0,1
?
save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices"/device:CPU:0*
dtypes
2*x
_output_shapesf
d: : : : :::: ::::::
b
save/Identity_63Identitysave/RestoreV2_1"/device:CPU:0*
_output_shapes
: *
T0
?
save/AssignVariableOp_6AssignVariableOp)dnn/hiddenlayer_0/batchnorm_0/beta/part_0save/Identity_63"/device:CPU:0*
dtype0
d
save/Identity_64Identitysave/RestoreV2_1:1"/device:CPU:0*
T0*
_output_shapes
: 
?
save/AssignVariableOp_7AssignVariableOp*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0save/Identity_64"/device:CPU:0*
dtype0
d
save/Identity_65Identitysave/RestoreV2_1:2"/device:CPU:0*
T0*
_output_shapes
: 
x
save/AssignVariableOp_8AssignVariableOpdnn/hiddenlayer_0/bias/part_0save/Identity_65"/device:CPU:0*
dtype0
h
save/Identity_66Identitysave/RestoreV2_1:3"/device:CPU:0*
T0*
_output_shapes

: 
z
save/AssignVariableOp_9AssignVariableOpdnn/hiddenlayer_0/kernel/part_0save/Identity_66"/device:CPU:0*
dtype0
d
save/Identity_67Identitysave/RestoreV2_1:4"/device:CPU:0*
_output_shapes
:*
T0
?
save/AssignVariableOp_10AssignVariableOp)dnn/hiddenlayer_1/batchnorm_1/beta/part_0save/Identity_67"/device:CPU:0*
dtype0
d
save/Identity_68Identitysave/RestoreV2_1:5"/device:CPU:0*
T0*
_output_shapes
:
?
save/AssignVariableOp_11AssignVariableOp*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0save/Identity_68"/device:CPU:0*
dtype0
d
save/Identity_69Identitysave/RestoreV2_1:6"/device:CPU:0*
T0*
_output_shapes
:
y
save/AssignVariableOp_12AssignVariableOpdnn/hiddenlayer_1/bias/part_0save/Identity_69"/device:CPU:0*
dtype0
h
save/Identity_70Identitysave/RestoreV2_1:7"/device:CPU:0*
_output_shapes

: *
T0
{
save/AssignVariableOp_13AssignVariableOpdnn/hiddenlayer_1/kernel/part_0save/Identity_70"/device:CPU:0*
dtype0
d
save/Identity_71Identitysave/RestoreV2_1:8"/device:CPU:0*
T0*
_output_shapes
:
?
save/AssignVariableOp_14AssignVariableOp)dnn/hiddenlayer_2/batchnorm_2/beta/part_0save/Identity_71"/device:CPU:0*
dtype0
d
save/Identity_72Identitysave/RestoreV2_1:9"/device:CPU:0*
_output_shapes
:*
T0
?
save/AssignVariableOp_15AssignVariableOp*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0save/Identity_72"/device:CPU:0*
dtype0
e
save/Identity_73Identitysave/RestoreV2_1:10"/device:CPU:0*
T0*
_output_shapes
:
y
save/AssignVariableOp_16AssignVariableOpdnn/hiddenlayer_2/bias/part_0save/Identity_73"/device:CPU:0*
dtype0
i
save/Identity_74Identitysave/RestoreV2_1:11"/device:CPU:0*
T0*
_output_shapes

:
{
save/AssignVariableOp_17AssignVariableOpdnn/hiddenlayer_2/kernel/part_0save/Identity_74"/device:CPU:0*
dtype0
e
save/Identity_75Identitysave/RestoreV2_1:12"/device:CPU:0*
T0*
_output_shapes
:
r
save/AssignVariableOp_18AssignVariableOpdnn/logits/bias/part_0save/Identity_75"/device:CPU:0*
dtype0
i
save/Identity_76Identitysave/RestoreV2_1:13"/device:CPU:0*
T0*
_output_shapes

:
t
save/AssignVariableOp_19AssignVariableOpdnn/logits/kernel/part_0save/Identity_76"/device:CPU:0*
dtype0
?
save/restore_shard_1NoOp^save/AssignVariableOp_10^save/AssignVariableOp_11^save/AssignVariableOp_12^save/AssignVariableOp_13^save/AssignVariableOp_14^save/AssignVariableOp_15^save/AssignVariableOp_16^save/AssignVariableOp_17^save/AssignVariableOp_18^save/AssignVariableOp_19^save/AssignVariableOp_6^save/AssignVariableOp_7^save/AssignVariableOp_8^save/AssignVariableOp_9"/device:CPU:0
2
save/restore_all/NoOpNoOp^save/restore_shard
E
save/restore_all/NoOp_1NoOp^save/restore_shard_1"/device:CPU:0
J
save/restore_allNoOp^save/restore_all/NoOp^save/restore_all/NoOp_1?
?
?
Atf_data_experimental_parallel_interleave_filename_to_dataset_2578
arg0
experimentalcsvdataset2DWrapper for passing nested structures to and from tf.data functions.?H
compression_typeConst"/device:CPU:0*
valueB B *
dtype0Q
record_defaults_0Const"/device:CPU:0*
valueB*    *
dtype0Q
record_defaults_1Const"/device:CPU:0*
dtype0*
valueBBnullQ
record_defaults_2Const"/device:CPU:0*
dtype0*
valueB*    Q
record_defaults_3Const"/device:CPU:0*
dtype0*
valueBBnullQ
record_defaults_4Const"/device:CPU:0*
dtype0*
valueB*    Q
record_defaults_5Const"/device:CPU:0*
valueB*    *
dtype0Q
record_defaults_6Const"/device:CPU:0*
valueBBnull*
dtype0Q
record_defaults_7Const"/device:CPU:0*
valueBBnull*
dtype0Q
record_defaults_8Const"/device:CPU:0*
dtype0*
valueBBnullR
record_defaults_9Const"/device:CPU:0*
valueBBnokey*
dtype0G
buffer_sizeConst"/device:CPU:0*
valueB
	 R???*
dtype0	?
headerConst"/device:CPU:0*
dtype0
*
value	B
 Z D
field_delimConst"/device:CPU:0*
value	B B,*
dtype0H
use_quote_delimConst"/device:CPU:0*
value	B
 Z*
dtype0
@
na_valueConst"/device:CPU:0*
valueB B *
dtype0C
select_colsConst"/device:CPU:0*
dtype0	*
valueB	 ?
ExperimentalCSVDatasetExperimentalCSVDatasetarg0compression_type:output:0buffer_size:output:0header:output:0field_delim:output:0use_quote_delim:output:0na_value:output:0select_cols:output:0record_defaults_0:output:0record_defaults_1:output:0record_defaults_2:output:0record_defaults_3:output:0record_defaults_4:output:0record_defaults_5:output:0record_defaults_6:output:0record_defaults_7:output:0record_defaults_8:output:0record_defaults_9:output:0"/device:CPU:0*
output_types
2
*'
output_shapes
: : : : : : : : : : "9
experimentalcsvdatasetExperimentalCSVDataset:handle:0
?
?
Dataset_map_<lambda>_2619

arg0_0

arg1_0

arg2_0

arg3_0

arg4_0

arg5_0

arg6_0

arg7_0

arg8_0

arg9_0
arg0
arg1
arg2
arg3
arg4
arg5
arg6
arg7
arg8
arg92DWrapper for passing nested structures to and from tf.data functions."
arg0arg0_0"
arg1arg1_0"
arg2arg2_0"
arg3arg3_0"
arg4arg4_0"
arg5arg5_0"
arg6arg6_0"
arg7arg7_0"
arg8arg8_0"
arg9arg9_0
?
?
Dataset_map_map_fn_2606

arg0_0

arg1_0

arg2_0

arg3_0

arg4_0

arg5_0

arg6_0

arg7_0

arg8_0

arg9_0
arg8
arg7
arg5
arg1
arg9
arg2
arg6
arg3
arg4
arg02DWrapper for passing nested structures to and from tf.data functions."
arg0arg0_0"
arg1arg1_0"
arg2arg2_0"
arg3arg3_0"
arg4arg4_0"
arg5arg5_0"
arg6arg6_0"
arg7arg7_0"
arg8arg8_0"
arg9arg9_0""&

summary_op

Merge/MergeSummary:0"?
	summaries?
?
learning_rate:0
/dnn/dnn/hiddenlayer_0/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_0/activation:0
/dnn/dnn/hiddenlayer_1/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_1/activation:0
/dnn/dnn/hiddenlayer_2/fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_2/activation:0
(dnn/dnn/logits/fraction_of_zero_values:0
dnn/dnn/logits/activation:0"?/
trainable_variables?.?.
?
[dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0:0`dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Assign`dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/read:0"`
Rdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights  "2xdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal:08
?
]dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0:0bdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Assignbdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/read:0"b
Tdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights  "2zdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal:08
?
Wdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0:0\dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Assign\dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/read:0"\
Ndnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights  "2tdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal:08
?
^dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0:0cdnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Assigncdnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/read:0"c
Udnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights  "2{dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal:08
?
[dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0:0`dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Assign`dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/read:0"`
Rdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights  "2xdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal:08
?
!dnn/hiddenlayer_0/kernel/part_0:0&dnn/hiddenlayer_0/kernel/part_0/Assign5dnn/hiddenlayer_0/kernel/part_0/Read/ReadVariableOp:0"&
dnn/hiddenlayer_0/kernel   " (2<dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform:08
?
dnn/hiddenlayer_0/bias/part_0:0$dnn/hiddenlayer_0/bias/part_0/Assign3dnn/hiddenlayer_0/bias/part_0/Read/ReadVariableOp:0"!
dnn/hiddenlayer_0/bias  " (21dnn/hiddenlayer_0/bias/part_0/Initializer/zeros:08
?
,dnn/hiddenlayer_0/batchnorm_0/gamma/part_0:01dnn/hiddenlayer_0/batchnorm_0/gamma/part_0/Assign@dnn/hiddenlayer_0/batchnorm_0/gamma/part_0/Read/ReadVariableOp:0".
#dnn/hiddenlayer_0/batchnorm_0/gamma  " (2=dnn/hiddenlayer_0/batchnorm_0/gamma/part_0/Initializer/ones:08
?
+dnn/hiddenlayer_0/batchnorm_0/beta/part_0:00dnn/hiddenlayer_0/batchnorm_0/beta/part_0/Assign?dnn/hiddenlayer_0/batchnorm_0/beta/part_0/Read/ReadVariableOp:0"-
"dnn/hiddenlayer_0/batchnorm_0/beta  " (2=dnn/hiddenlayer_0/batchnorm_0/beta/part_0/Initializer/zeros:08
?
!dnn/hiddenlayer_1/kernel/part_0:0&dnn/hiddenlayer_1/kernel/part_0/Assign5dnn/hiddenlayer_1/kernel/part_0/Read/ReadVariableOp:0"&
dnn/hiddenlayer_1/kernel   " (2<dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform:08
?
dnn/hiddenlayer_1/bias/part_0:0$dnn/hiddenlayer_1/bias/part_0/Assign3dnn/hiddenlayer_1/bias/part_0/Read/ReadVariableOp:0"!
dnn/hiddenlayer_1/bias "(21dnn/hiddenlayer_1/bias/part_0/Initializer/zeros:08
?
,dnn/hiddenlayer_1/batchnorm_1/gamma/part_0:01dnn/hiddenlayer_1/batchnorm_1/gamma/part_0/Assign@dnn/hiddenlayer_1/batchnorm_1/gamma/part_0/Read/ReadVariableOp:0".
#dnn/hiddenlayer_1/batchnorm_1/gamma "(2=dnn/hiddenlayer_1/batchnorm_1/gamma/part_0/Initializer/ones:08
?
+dnn/hiddenlayer_1/batchnorm_1/beta/part_0:00dnn/hiddenlayer_1/batchnorm_1/beta/part_0/Assign?dnn/hiddenlayer_1/batchnorm_1/beta/part_0/Read/ReadVariableOp:0"-
"dnn/hiddenlayer_1/batchnorm_1/beta "(2=dnn/hiddenlayer_1/batchnorm_1/beta/part_0/Initializer/zeros:08
?
!dnn/hiddenlayer_2/kernel/part_0:0&dnn/hiddenlayer_2/kernel/part_0/Assign5dnn/hiddenlayer_2/kernel/part_0/Read/ReadVariableOp:0"&
dnn/hiddenlayer_2/kernel  "(2<dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform:08
?
dnn/hiddenlayer_2/bias/part_0:0$dnn/hiddenlayer_2/bias/part_0/Assign3dnn/hiddenlayer_2/bias/part_0/Read/ReadVariableOp:0"!
dnn/hiddenlayer_2/bias "(21dnn/hiddenlayer_2/bias/part_0/Initializer/zeros:08
?
,dnn/hiddenlayer_2/batchnorm_2/gamma/part_0:01dnn/hiddenlayer_2/batchnorm_2/gamma/part_0/Assign@dnn/hiddenlayer_2/batchnorm_2/gamma/part_0/Read/ReadVariableOp:0".
#dnn/hiddenlayer_2/batchnorm_2/gamma "(2=dnn/hiddenlayer_2/batchnorm_2/gamma/part_0/Initializer/ones:08
?
+dnn/hiddenlayer_2/batchnorm_2/beta/part_0:00dnn/hiddenlayer_2/batchnorm_2/beta/part_0/Assign?dnn/hiddenlayer_2/batchnorm_2/beta/part_0/Read/ReadVariableOp:0"-
"dnn/hiddenlayer_2/batchnorm_2/beta "(2=dnn/hiddenlayer_2/batchnorm_2/beta/part_0/Initializer/zeros:08
?
dnn/logits/kernel/part_0:0dnn/logits/kernel/part_0/Assign.dnn/logits/kernel/part_0/Read/ReadVariableOp:0"
dnn/logits/kernel  "(25dnn/logits/kernel/part_0/Initializer/random_uniform:08
?
dnn/logits/bias/part_0:0dnn/logits/bias/part_0/Assign,dnn/logits/bias/part_0/Read/ReadVariableOp:0"
dnn/logits/bias "(2*dnn/logits/bias/part_0/Initializer/zeros:08"
init_op

group_deps_1")
ready_for_local_init_op


concat_1:0"
	eval_step

eval_step:0"?
metric_variables?
?
mean/total:0
mean/count:0
prediction/mean/total:0
prediction/mean/count:0
mean_1/total:0
mean_1/count:0
mean_2/total:0
mean_2/count:0"??
cond_context????
?
 dnn/zero_fraction/cond/cond_text dnn/zero_fraction/cond/pred_id:0!dnn/zero_fraction/cond/switch_t:0 *?
/dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1:0
dnn/zero_fraction/cond/Cast:0
+dnn/zero_fraction/cond/count_nonzero/Cast:0
,dnn/zero_fraction/cond/count_nonzero/Const:0
6dnn/zero_fraction/cond/count_nonzero/NotEqual/Switch:1
/dnn/zero_fraction/cond/count_nonzero/NotEqual:0
4dnn/zero_fraction/cond/count_nonzero/nonzero_count:0
,dnn/zero_fraction/cond/count_nonzero/zeros:0
 dnn/zero_fraction/cond/pred_id:0
!dnn/zero_fraction/cond/switch_t:0D
 dnn/zero_fraction/cond/pred_id:0 dnn/zero_fraction/cond/pred_id:0i
/dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1:06dnn/zero_fraction/cond/count_nonzero/NotEqual/Switch:1
?
"dnn/zero_fraction/cond/cond_text_1 dnn/zero_fraction/cond/pred_id:0!dnn/zero_fraction/cond/switch_f:0*?
/dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1:0
-dnn/zero_fraction/cond/count_nonzero_1/Cast:0
.dnn/zero_fraction/cond/count_nonzero_1/Const:0
8dnn/zero_fraction/cond/count_nonzero_1/NotEqual/Switch:0
1dnn/zero_fraction/cond/count_nonzero_1/NotEqual:0
6dnn/zero_fraction/cond/count_nonzero_1/nonzero_count:0
.dnn/zero_fraction/cond/count_nonzero_1/zeros:0
 dnn/zero_fraction/cond/pred_id:0
!dnn/zero_fraction/cond/switch_f:0D
 dnn/zero_fraction/cond/pred_id:0 dnn/zero_fraction/cond/pred_id:0k
/dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1:08dnn/zero_fraction/cond/count_nonzero_1/NotEqual/Switch:0
?
"dnn/zero_fraction_1/cond/cond_text"dnn/zero_fraction_1/cond/pred_id:0#dnn/zero_fraction_1/cond/switch_t:0 *?
/dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1:0
dnn/zero_fraction_1/cond/Cast:0
-dnn/zero_fraction_1/cond/count_nonzero/Cast:0
.dnn/zero_fraction_1/cond/count_nonzero/Const:0
8dnn/zero_fraction_1/cond/count_nonzero/NotEqual/Switch:1
1dnn/zero_fraction_1/cond/count_nonzero/NotEqual:0
6dnn/zero_fraction_1/cond/count_nonzero/nonzero_count:0
.dnn/zero_fraction_1/cond/count_nonzero/zeros:0
"dnn/zero_fraction_1/cond/pred_id:0
#dnn/zero_fraction_1/cond/switch_t:0H
"dnn/zero_fraction_1/cond/pred_id:0"dnn/zero_fraction_1/cond/pred_id:0k
/dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1:08dnn/zero_fraction_1/cond/count_nonzero/NotEqual/Switch:1
?
$dnn/zero_fraction_1/cond/cond_text_1"dnn/zero_fraction_1/cond/pred_id:0#dnn/zero_fraction_1/cond/switch_f:0*?
/dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1:0
/dnn/zero_fraction_1/cond/count_nonzero_1/Cast:0
0dnn/zero_fraction_1/cond/count_nonzero_1/Const:0
:dnn/zero_fraction_1/cond/count_nonzero_1/NotEqual/Switch:0
3dnn/zero_fraction_1/cond/count_nonzero_1/NotEqual:0
8dnn/zero_fraction_1/cond/count_nonzero_1/nonzero_count:0
0dnn/zero_fraction_1/cond/count_nonzero_1/zeros:0
"dnn/zero_fraction_1/cond/pred_id:0
#dnn/zero_fraction_1/cond/switch_f:0H
"dnn/zero_fraction_1/cond/pred_id:0"dnn/zero_fraction_1/cond/pred_id:0m
/dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1:0:dnn/zero_fraction_1/cond/count_nonzero_1/NotEqual/Switch:0
?
"dnn/zero_fraction_2/cond/cond_text"dnn/zero_fraction_2/cond/pred_id:0#dnn/zero_fraction_2/cond/switch_t:0 *?
/dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1:0
dnn/zero_fraction_2/cond/Cast:0
-dnn/zero_fraction_2/cond/count_nonzero/Cast:0
.dnn/zero_fraction_2/cond/count_nonzero/Const:0
8dnn/zero_fraction_2/cond/count_nonzero/NotEqual/Switch:1
1dnn/zero_fraction_2/cond/count_nonzero/NotEqual:0
6dnn/zero_fraction_2/cond/count_nonzero/nonzero_count:0
.dnn/zero_fraction_2/cond/count_nonzero/zeros:0
"dnn/zero_fraction_2/cond/pred_id:0
#dnn/zero_fraction_2/cond/switch_t:0k
/dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1:08dnn/zero_fraction_2/cond/count_nonzero/NotEqual/Switch:1H
"dnn/zero_fraction_2/cond/pred_id:0"dnn/zero_fraction_2/cond/pred_id:0
?
$dnn/zero_fraction_2/cond/cond_text_1"dnn/zero_fraction_2/cond/pred_id:0#dnn/zero_fraction_2/cond/switch_f:0*?
/dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1:0
/dnn/zero_fraction_2/cond/count_nonzero_1/Cast:0
0dnn/zero_fraction_2/cond/count_nonzero_1/Const:0
:dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual/Switch:0
3dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual:0
8dnn/zero_fraction_2/cond/count_nonzero_1/nonzero_count:0
0dnn/zero_fraction_2/cond/count_nonzero_1/zeros:0
"dnn/zero_fraction_2/cond/pred_id:0
#dnn/zero_fraction_2/cond/switch_f:0m
/dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1:0:dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual/Switch:0H
"dnn/zero_fraction_2/cond/pred_id:0"dnn/zero_fraction_2/cond/pred_id:0
?
"dnn/zero_fraction_3/cond/cond_text"dnn/zero_fraction_3/cond/pred_id:0#dnn/zero_fraction_3/cond/switch_t:0 *?
dnn/logits/BiasAdd:0
dnn/zero_fraction_3/cond/Cast:0
-dnn/zero_fraction_3/cond/count_nonzero/Cast:0
.dnn/zero_fraction_3/cond/count_nonzero/Const:0
8dnn/zero_fraction_3/cond/count_nonzero/NotEqual/Switch:1
1dnn/zero_fraction_3/cond/count_nonzero/NotEqual:0
6dnn/zero_fraction_3/cond/count_nonzero/nonzero_count:0
.dnn/zero_fraction_3/cond/count_nonzero/zeros:0
"dnn/zero_fraction_3/cond/pred_id:0
#dnn/zero_fraction_3/cond/switch_t:0P
dnn/logits/BiasAdd:08dnn/zero_fraction_3/cond/count_nonzero/NotEqual/Switch:1H
"dnn/zero_fraction_3/cond/pred_id:0"dnn/zero_fraction_3/cond/pred_id:0
?
$dnn/zero_fraction_3/cond/cond_text_1"dnn/zero_fraction_3/cond/pred_id:0#dnn/zero_fraction_3/cond/switch_f:0*?
dnn/logits/BiasAdd:0
/dnn/zero_fraction_3/cond/count_nonzero_1/Cast:0
0dnn/zero_fraction_3/cond/count_nonzero_1/Const:0
:dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual/Switch:0
3dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual:0
8dnn/zero_fraction_3/cond/count_nonzero_1/nonzero_count:0
0dnn/zero_fraction_3/cond/count_nonzero_1/zeros:0
"dnn/zero_fraction_3/cond/pred_id:0
#dnn/zero_fraction_3/cond/switch_f:0R
dnn/logits/BiasAdd:0:dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual/Switch:0H
"dnn/zero_fraction_3/cond/pred_id:0"dnn/zero_fraction_3/cond/pred_id:0
?
Qprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/cond_textQprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/pred_id:0Rprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/switch_t:0 *?
Dprediction/mean/broadcast_weights_1/assert_broadcastable/is_scalar:0
Rprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/Switch_1:0
Rprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/Switch_1:1
Qprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/pred_id:0
Rprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/switch_t:0?
Qprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/pred_id:0Qprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/pred_id:0?
Dprediction/mean/broadcast_weights_1/assert_broadcastable/is_scalar:0Rprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/Switch_1:1
?Y
Sprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/cond_text_1Qprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/pred_id:0Rprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/switch_f:0*?)
iprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/Merge:0
iprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/Merge:1
jprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/Switch:0
jprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/Switch:1
lprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/Switch_1:0
lprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/Switch_1:1
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/DenseToDenseSetOperation:0
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/DenseToDenseSetOperation:1
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/DenseToDenseSetOperation:2
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims/Switch:0
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims/Switch_1:1
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims/dim:0
prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims:0
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1/Switch:0
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1/Switch_1:1
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1/dim:0
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1:0
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/concat/axis:0
{prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/concat:0
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/num_invalid_dims:0
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ones_like/Const:0
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ones_like/Shape:0
~prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ones_like:0
vprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/x:0
tprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims:0
wprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rank/Switch:0
yprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rank/Switch_1:0
pprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rank:0
kprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/pred_id:0
lprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/switch_f:0
lprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/switch_t:0
Qprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/pred_id:0
Rprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/switch_f:0
Fprediction/mean/broadcast_weights_1/assert_broadcastable/values/rank:0
Gprediction/mean/broadcast_weights_1/assert_broadcastable/values/shape:0
Gprediction/mean/broadcast_weights_1/assert_broadcastable/weights/rank:0
Hprediction/mean/broadcast_weights_1/assert_broadcastable/weights/shape:0?
Fprediction/mean/broadcast_weights_1/assert_broadcastable/values/rank:0wprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rank/Switch:0?
Hprediction/mean/broadcast_weights_1/assert_broadcastable/weights/shape:0?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1/Switch:0?
Qprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/pred_id:0Qprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/pred_id:0?
Gprediction/mean/broadcast_weights_1/assert_broadcastable/values/shape:0?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims/Switch:0?
Gprediction/mean/broadcast_weights_1/assert_broadcastable/weights/rank:0yprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rank/Switch_1:02?"
?"
kprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/cond_textkprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/pred_id:0lprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/switch_t:0 *? 
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/DenseToDenseSetOperation:0
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/DenseToDenseSetOperation:1
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/DenseToDenseSetOperation:2
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims/Switch:0
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims/Switch_1:1
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims/dim:0
prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims:0
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1/Switch:0
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1/Switch_1:1
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1/dim:0
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1:0
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/concat/axis:0
{prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/concat:0
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/num_invalid_dims:0
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ones_like/Const:0
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ones_like/Shape:0
~prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ones_like:0
vprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/x:0
tprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims:0
kprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/pred_id:0
lprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/switch_t:0
Gprediction/mean/broadcast_weights_1/assert_broadcastable/values/shape:0
Hprediction/mean/broadcast_weights_1/assert_broadcastable/weights/shape:0?
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims/Switch:0?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims/Switch:0?
Gprediction/mean/broadcast_weights_1/assert_broadcastable/values/shape:0?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims/Switch_1:1?
Hprediction/mean/broadcast_weights_1/assert_broadcastable/weights/shape:0?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1/Switch_1:1?
kprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/pred_id:0kprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/pred_id:0?
?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1/Switch:0?prediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/has_invalid_dims/ExpandDims_1/Switch:02?

?

mprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/cond_text_1kprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/pred_id:0lprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/switch_f:0*?
lprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/Switch_1:0
lprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/Switch_1:1
pprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rank:0
kprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/pred_id:0
lprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/switch_f:0?
pprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/is_same_rank:0lprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/Switch_1:0?
kprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/pred_id:0kprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/has_valid_nonscalar_shape/pred_id:0
?
Nprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/cond_textNprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/pred_id:0Oprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_t:0 *?
Yprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/control_dependency:0
Nprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/pred_id:0
Oprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_t:0?
Nprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/pred_id:0Nprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/pred_id:0
?
Pprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/cond_text_1Nprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/pred_id:0Oprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_f:0*?
Tprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/Switch:0
Vprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/Switch_1:0
Vprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/Switch_2:0
Vprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/Switch_3:0
Tprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_0:0
Tprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_1:0
Tprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_2:0
Tprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_4:0
Tprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_5:0
Tprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/data_7:0
[prediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/control_dependency_1:0
Nprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/pred_id:0
Oprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/switch_f:0
Dprediction/mean/broadcast_weights_1/assert_broadcastable/is_scalar:0
Oprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/Merge:0
Gprediction/mean/broadcast_weights_1/assert_broadcastable/values/shape:0
Hprediction/mean/broadcast_weights_1/assert_broadcastable/weights/shape:0?
Hprediction/mean/broadcast_weights_1/assert_broadcastable/weights/shape:0Vprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/Switch_1:0?
Nprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/pred_id:0Nprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/pred_id:0?
Dprediction/mean/broadcast_weights_1/assert_broadcastable/is_scalar:0Vprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/Switch_3:0?
Gprediction/mean/broadcast_weights_1/assert_broadcastable/values/shape:0Vprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/Switch_2:0?
Oprediction/mean/broadcast_weights_1/assert_broadcastable/is_valid_shape/Merge:0Tprediction/mean/broadcast_weights_1/assert_broadcastable/AssertGuard/Assert/Switch:0"?
local_variables??
T
mean/total:0mean/total/Assignmean/total/read:02mean/total/Initializer/zeros:0
T
mean/count:0mean/count/Assignmean/count/read:02mean/count/Initializer/zeros:0
?
prediction/mean/total:0prediction/mean/total/Assignprediction/mean/total/read:02)prediction/mean/total/Initializer/zeros:0
?
prediction/mean/count:0prediction/mean/count/Assignprediction/mean/count/read:02)prediction/mean/count/Initializer/zeros:0
\
mean_1/total:0mean_1/total/Assignmean_1/total/read:02 mean_1/total/Initializer/zeros:0
\
mean_1/count:0mean_1/count/Assignmean_1/count/read:02 mean_1/count/Initializer/zeros:0
\
mean_2/total:0mean_2/total/Assignmean_2/total/read:02 mean_2/total/Initializer/zeros:0
\
mean_2/count:0mean_2/count/Assignmean_2/count/read:02 mean_2/count/Initializer/zeros:0
P
eval_step:0eval_step/Assigneval_step/read:02eval_step/Initializer/zeros:0"!
local_init_op

group_deps_2"?:
	variables?:?:
X
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0
?
[dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0:0`dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Assign`dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/read:0"`
Rdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights  "2xdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal:08
?
]dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0:0bdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Assignbdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/read:0"b
Tdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights  "2zdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal:08
?
Wdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0:0\dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Assign\dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/read:0"\
Ndnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights  "2tdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal:08
?
^dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0:0cdnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Assigncdnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/read:0"c
Udnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights  "2{dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal:08
?
[dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0:0`dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Assign`dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/read:0"`
Rdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights  "2xdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal:08
?
!dnn/hiddenlayer_0/kernel/part_0:0&dnn/hiddenlayer_0/kernel/part_0/Assign5dnn/hiddenlayer_0/kernel/part_0/Read/ReadVariableOp:0"&
dnn/hiddenlayer_0/kernel   " (2<dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform:08
?
dnn/hiddenlayer_0/bias/part_0:0$dnn/hiddenlayer_0/bias/part_0/Assign3dnn/hiddenlayer_0/bias/part_0/Read/ReadVariableOp:0"!
dnn/hiddenlayer_0/bias  " (21dnn/hiddenlayer_0/bias/part_0/Initializer/zeros:08
?
,dnn/hiddenlayer_0/batchnorm_0/gamma/part_0:01dnn/hiddenlayer_0/batchnorm_0/gamma/part_0/Assign@dnn/hiddenlayer_0/batchnorm_0/gamma/part_0/Read/ReadVariableOp:0".
#dnn/hiddenlayer_0/batchnorm_0/gamma  " (2=dnn/hiddenlayer_0/batchnorm_0/gamma/part_0/Initializer/ones:08
?
+dnn/hiddenlayer_0/batchnorm_0/beta/part_0:00dnn/hiddenlayer_0/batchnorm_0/beta/part_0/Assign?dnn/hiddenlayer_0/batchnorm_0/beta/part_0/Read/ReadVariableOp:0"-
"dnn/hiddenlayer_0/batchnorm_0/beta  " (2=dnn/hiddenlayer_0/batchnorm_0/beta/part_0/Initializer/zeros:08
?
+dnn/hiddenlayer_0/batchnorm_0/moving_mean:00dnn/hiddenlayer_0/batchnorm_0/moving_mean/Assign?dnn/hiddenlayer_0/batchnorm_0/moving_mean/Read/ReadVariableOp:0(2=dnn/hiddenlayer_0/batchnorm_0/moving_mean/Initializer/zeros:0
?
/dnn/hiddenlayer_0/batchnorm_0/moving_variance:04dnn/hiddenlayer_0/batchnorm_0/moving_variance/AssignCdnn/hiddenlayer_0/batchnorm_0/moving_variance/Read/ReadVariableOp:0(2@dnn/hiddenlayer_0/batchnorm_0/moving_variance/Initializer/ones:0
?
!dnn/hiddenlayer_1/kernel/part_0:0&dnn/hiddenlayer_1/kernel/part_0/Assign5dnn/hiddenlayer_1/kernel/part_0/Read/ReadVariableOp:0"&
dnn/hiddenlayer_1/kernel   " (2<dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform:08
?
dnn/hiddenlayer_1/bias/part_0:0$dnn/hiddenlayer_1/bias/part_0/Assign3dnn/hiddenlayer_1/bias/part_0/Read/ReadVariableOp:0"!
dnn/hiddenlayer_1/bias "(21dnn/hiddenlayer_1/bias/part_0/Initializer/zeros:08
?
,dnn/hiddenlayer_1/batchnorm_1/gamma/part_0:01dnn/hiddenlayer_1/batchnorm_1/gamma/part_0/Assign@dnn/hiddenlayer_1/batchnorm_1/gamma/part_0/Read/ReadVariableOp:0".
#dnn/hiddenlayer_1/batchnorm_1/gamma "(2=dnn/hiddenlayer_1/batchnorm_1/gamma/part_0/Initializer/ones:08
?
+dnn/hiddenlayer_1/batchnorm_1/beta/part_0:00dnn/hiddenlayer_1/batchnorm_1/beta/part_0/Assign?dnn/hiddenlayer_1/batchnorm_1/beta/part_0/Read/ReadVariableOp:0"-
"dnn/hiddenlayer_1/batchnorm_1/beta "(2=dnn/hiddenlayer_1/batchnorm_1/beta/part_0/Initializer/zeros:08
?
+dnn/hiddenlayer_1/batchnorm_1/moving_mean:00dnn/hiddenlayer_1/batchnorm_1/moving_mean/Assign?dnn/hiddenlayer_1/batchnorm_1/moving_mean/Read/ReadVariableOp:0(2=dnn/hiddenlayer_1/batchnorm_1/moving_mean/Initializer/zeros:0
?
/dnn/hiddenlayer_1/batchnorm_1/moving_variance:04dnn/hiddenlayer_1/batchnorm_1/moving_variance/AssignCdnn/hiddenlayer_1/batchnorm_1/moving_variance/Read/ReadVariableOp:0(2@dnn/hiddenlayer_1/batchnorm_1/moving_variance/Initializer/ones:0
?
!dnn/hiddenlayer_2/kernel/part_0:0&dnn/hiddenlayer_2/kernel/part_0/Assign5dnn/hiddenlayer_2/kernel/part_0/Read/ReadVariableOp:0"&
dnn/hiddenlayer_2/kernel  "(2<dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform:08
?
dnn/hiddenlayer_2/bias/part_0:0$dnn/hiddenlayer_2/bias/part_0/Assign3dnn/hiddenlayer_2/bias/part_0/Read/ReadVariableOp:0"!
dnn/hiddenlayer_2/bias "(21dnn/hiddenlayer_2/bias/part_0/Initializer/zeros:08
?
,dnn/hiddenlayer_2/batchnorm_2/gamma/part_0:01dnn/hiddenlayer_2/batchnorm_2/gamma/part_0/Assign@dnn/hiddenlayer_2/batchnorm_2/gamma/part_0/Read/ReadVariableOp:0".
#dnn/hiddenlayer_2/batchnorm_2/gamma "(2=dnn/hiddenlayer_2/batchnorm_2/gamma/part_0/Initializer/ones:08
?
+dnn/hiddenlayer_2/batchnorm_2/beta/part_0:00dnn/hiddenlayer_2/batchnorm_2/beta/part_0/Assign?dnn/hiddenlayer_2/batchnorm_2/beta/part_0/Read/ReadVariableOp:0"-
"dnn/hiddenlayer_2/batchnorm_2/beta "(2=dnn/hiddenlayer_2/batchnorm_2/beta/part_0/Initializer/zeros:08
?
+dnn/hiddenlayer_2/batchnorm_2/moving_mean:00dnn/hiddenlayer_2/batchnorm_2/moving_mean/Assign?dnn/hiddenlayer_2/batchnorm_2/moving_mean/Read/ReadVariableOp:0(2=dnn/hiddenlayer_2/batchnorm_2/moving_mean/Initializer/zeros:0
?
/dnn/hiddenlayer_2/batchnorm_2/moving_variance:04dnn/hiddenlayer_2/batchnorm_2/moving_variance/AssignCdnn/hiddenlayer_2/batchnorm_2/moving_variance/Read/ReadVariableOp:0(2@dnn/hiddenlayer_2/batchnorm_2/moving_variance/Initializer/ones:0
?
dnn/logits/kernel/part_0:0dnn/logits/kernel/part_0/Assign.dnn/logits/kernel/part_0/Read/ReadVariableOp:0"
dnn/logits/kernel  "(25dnn/logits/kernel/part_0/Initializer/random_uniform:08
?
dnn/logits/bias/part_0:0dnn/logits/bias/part_0/Assign,dnn/logits/bias/part_0/Read/ReadVariableOp:0"
dnn/logits/bias "(2*dnn/logits/bias/part_0/Initializer/zeros:08"
ready_op


concat:0"?
table_initializer?
?
idnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/hash_table/table_init
mdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/hash_table/table_init
adnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/hash_table/table_init
odnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/hash_table/table_init
idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_table/table_init"M
saversCA
?
save/Const:0save/Identity_56:0save/restore_all (5 @F8"E
losses;
9
head/mean_squared_error/Mul:0
head/weighted_loss/Sum:0"k
global_step\Z
X
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0"
	iterators

IteratorV2:0?SqH[       ?	??V?(?A?*M


label/mean^??@

average_loss???@

prediction/mean?V?@

loss=?D??QY       ?e?	+??V?(?A?*K
I
checkpoint_pathB6 B0trained_models/housing_regressor/model.ckpt-1000۟\?