??
?+?+
:
Add
x"T
y"T
z"T"
Ttype:
2	
x
Assign
ref"T?

value"T

output_ref"T?"	
Ttype"
validate_shapebool("
use_lockingbool(?
B
AssignVariableOp
resource
value"dtype"
dtypetype?
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
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
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
?
	LessEqual
x"T
y"T
z
"
Ttype:
2	
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
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
N
Merge
inputs"T*N
output"T
value_index"	
Ttype"
Nint(0
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(?
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
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
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
Ttype"serve*1.13.12v1.13.0-rc2-5-g6612da89518ȃ

global_step/Initializer/zerosConst*
value	B	 R *
_class
loc:@global_step*
dtype0	*
_output_shapes
: 
k
global_step
VariableV2*
_class
loc:@global_step*
dtype0	*
_output_shapes
: *
shape: 
?
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
T0	*
_class
loc:@global_step*
_output_shapes
: 
j
global_step/readIdentityglobal_step*
_output_shapes
: *
T0	*
_class
loc:@global_step
f
PlaceholderPlaceholder*
dtype0*#
_output_shapes
:?????????*
shape:?????????
h
Placeholder_1Placeholder*
dtype0*#
_output_shapes
:?????????*
shape:?????????
h
Placeholder_2Placeholder*
shape:?????????*
dtype0*#
_output_shapes
:?????????
h
Placeholder_3Placeholder*
shape:?????????*
dtype0*#
_output_shapes
:?????????
h
Placeholder_4Placeholder*
dtype0*#
_output_shapes
:?????????*
shape:?????????
h
Placeholder_5Placeholder*
dtype0*#
_output_shapes
:?????????*
shape:?????????
h
Placeholder_6Placeholder*
dtype0*#
_output_shapes
:?????????*
shape:?????????
h
Placeholder_7Placeholder*
dtype0*#
_output_shapes
:?????????*
shape:?????????
Y
ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
?????????
i

ExpandDims
ExpandDimsPlaceholder_6ExpandDims/dim*
T0*'
_output_shapes
:?????????
[
ExpandDims_1/dimConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
m
ExpandDims_1
ExpandDimsPlaceholder_4ExpandDims_1/dim*
T0*'
_output_shapes
:?????????
[
ExpandDims_2/dimConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
k
ExpandDims_2
ExpandDimsPlaceholderExpandDims_2/dim*
T0*'
_output_shapes
:?????????
[
ExpandDims_3/dimConst*
dtype0*
_output_shapes
: *
valueB :
?????????
m
ExpandDims_3
ExpandDimsPlaceholder_2ExpandDims_3/dim*
T0*'
_output_shapes
:?????????
[
ExpandDims_4/dimConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
m
ExpandDims_4
ExpandDimsPlaceholder_3ExpandDims_4/dim*
T0*'
_output_shapes
:?????????
[
ExpandDims_5/dimConst*
dtype0*
_output_shapes
: *
valueB :
?????????
m
ExpandDims_5
ExpandDimsPlaceholder_7ExpandDims_5/dim*
T0*'
_output_shapes
:?????????
[
ExpandDims_6/dimConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
m
ExpandDims_6
ExpandDimsPlaceholder_5ExpandDims_6/dim*
T0*'
_output_shapes
:?????????
[
ExpandDims_7/dimConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
m
ExpandDims_7
ExpandDimsPlaceholder_1ExpandDims_7/dim*
T0*'
_output_shapes
:?????????
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
f
ExponentialDecay/CastCastExponentialDecay/Cast/x*

SrcT0*
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
a
ExponentialDecay/Cast_2Castglobal_step/read*
_output_shapes
: *

DstT0*

SrcT0	
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
learning_rateScalarSummarylearning_rate/tagsExponentialDecay*
_output_shapes
: *
T0
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
seedޱ?	*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
seed2)*
dtype0*
_output_shapes

:
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
VariableV2*
dtype0*
_output_shapes

:*
shape
:*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0
?
`dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/AssignAssignYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0vdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/Initializer/truncated_normal*
_output_shapes

:*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0
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
}dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/meanConst*
valueB
 *    *n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
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
seed22*
dtype0*
_output_shapes

:*
seedޱ?	*
T0*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0
?
|dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/mulMul?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormaldnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddev*
_output_shapes

:*
T0*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0
?
xdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normalAdd|dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/mul}dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal/mean*
T0*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
_output_shapes

:
?
[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0
VariableV2*
shape
:*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
dtype0*
_output_shapes

:
?
bdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/AssignAssign[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0xdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/Initializer/truncated_normal*
T0*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
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
wdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/meanConst*
dtype0*
_output_shapes
: *
valueB
 *    *h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0
?
ydnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *?5?*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0
?
?dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormalTruncatedNormalxdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal/shape*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
seed2;*
dtype0*
_output_shapes

:*
seedޱ?	
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
VariableV2*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
dtype0*
_output_shapes

:*
shape
:
?
\dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/AssignAssignUdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0rdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/Initializer/truncated_normal*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
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
~dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal/meanConst*
dtype0*
_output_shapes
: *
valueB
 *    *o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0
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
seed2D*
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

:*
shape
:*o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0
?
cdnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/AssignAssign\dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0ydnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0/Initializer/truncated_normal*
T0*o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
_output_shapes

:
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
{dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/meanConst*
dtype0*
_output_shapes
: *
valueB
 *    *l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0
?
}dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *   ?*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0
?
?dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormalTruncatedNormal|dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/shape*
dtype0*
_output_shapes

:*
seedޱ?	*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
seed2M
?
zdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/mulMul?dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/TruncatedNormal}dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/stddev*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
_output_shapes

:
?
vdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normalAddzdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/mul{dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal/mean*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
_output_shapes

:
?
Ydnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0
VariableV2*
dtype0*
_output_shapes

:*
shape
:*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0
?
`dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/AssignAssignYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0vdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/Initializer/truncated_normal*
_output_shapes

:*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0
?
^dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/readIdentityYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
_output_shapes

:
?
_dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/ignore_value/xConst*
valueB B *
dtype0*
_output_shapes
: 
?
Ydnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/NotEqualNotEqualExpandDims_5_dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/ignore_value/x*
T0*'
_output_shapes
:?????????
?
Xdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/indicesWhereYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/NotEqual*'
_output_shapes
:?????????
?
Wdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/valuesGatherNdExpandDims_5Xdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/indices*
Tindices0	*
Tparams0*#
_output_shapes
:?????????
?
\dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/dense_shapeShapeExpandDims_5*
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
_dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
?
_dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
Ydnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/rangeRange_dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/range/startXdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/Size_dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/range/delta*
_output_shapes
:
?
[dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/ToInt64CastYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/range*

SrcT0*
_output_shapes
:*

DstT0	
?
ddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/hash_table/ConstConst*
valueB	 R
?????????*
dtype0	*
_output_shapes
: 
?
^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/hash_tableHashTableV2*
value_dtype0	*
	key_dtype0*
_output_shapes
: 
?
idnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/hash_table/table_initLookupTableImportV2^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/hash_tableYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/Const[dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/ToInt64*

Tout0	*	
Tin0
?
Rdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/hash_table_LookupLookupTableFindV2^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/hash_tableWdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/valuesddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/hash_table/Const*

Tout0	*#
_output_shapes
:?????????*	
Tin0
?
jdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice/beginConst*
dtype0*
_output_shapes
:*
valueB: 
?
idnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
?
ddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SliceSlice\dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/dense_shapejdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice/beginidnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Slice/size*
Index0*
T0	*
_output_shapes
:
?
ddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
?
cdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/ProdProdddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Sliceddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Const*
T0	*
_output_shapes
: 
?
odnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2/indicesConst*
value	B :*
dtype0*
_output_shapes
: 
?
ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
?
gdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2GatherV2\dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/dense_shapeodnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2/indicesldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2/axis*
_output_shapes
: *
Taxis0*
Tindices0*
Tparams0	
?
ednn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Cast/xPackcdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Prodgdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2*
T0	*
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
kdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GreaterEqualGreaterEqualudnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseReshape/Identitymdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GreaterEqual/y*
T0	*#
_output_shapes
:?????????
?
ddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/WhereWherekdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GreaterEqual*'
_output_shapes
:?????????
?
ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape/shapeConst*
valueB:
?????????*
dtype0*
_output_shapes
:
?
fdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/ReshapeReshapeddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Whereldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape/shape*#
_output_shapes
:?????????*
T0	
?
ndnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
idnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2_1GatherV2ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseReshapefdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshapendnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2_1/axis*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????*
Taxis0
?
ndnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
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
dtype0*
_output_shapes
:*
valueB"        
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
?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlice?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
shrink_axis_mask*

begin_mask*
end_mask*#
_output_shapes
:?????????*
Index0*
T0	
?
{dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/CastCast?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*#
_output_shapes
:?????????*

DstT0
?
}dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/UniqueUnique?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*2
_output_shapes 
:?????????:?????????
?
?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/axisConst*
dtype0*
_output_shapes
: *
value	B : *l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0
?
?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/embedding_lookupGatherV2^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0/read}dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/Unique?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/axis*
Taxis0*
Tindices0	*
Tparams0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*'
_output_shapes
:?????????
?
?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentity?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:?????????
?
vdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparseSparseSegmentMean?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identitydnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/Unique:1{dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse/Cast*'
_output_shapes
:?????????*
T0
?
ndnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape_1/shapeConst*
valueB"????   *
dtype0*
_output_shapes
:
?
hdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape_1Reshape?dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:2ndnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape_1/shape*
T0
*'
_output_shapes
:?????????
?
ddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/ShapeShapevdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse*
T0*
_output_shapes
:
?
rdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:
?
tdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
?
tdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_sliceStridedSliceddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Shaperdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_slice/stacktdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_slice/stack_1tdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_slice/stack_2*
shrink_axis_mask*
Index0*
T0*
_output_shapes
: 
?
fdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/stack/0Const*
dtype0*
_output_shapes
: *
value	B :
?
ddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/stackPackfdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/stack/0ldnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/strided_slice*
T0*
N*
_output_shapes
:
?
cdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/TileTilehdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape_1ddnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/stack*
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
^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weightsSelectcdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Tileidnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/zeros_likevdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/embedding_lookup_sparse*'
_output_shapes
:?????????*
T0
?
ednn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Cast_1Cast\dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/to_sparse_input/dense_shape*
_output_shapes
:*

DstT0*

SrcT0	
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
?
fdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Shape_1Shape^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights*
T0*
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
N*
_output_shapes
:*
T0
?
hdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape_2Reshape^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weightsednn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/concat*
T0*'
_output_shapes
:?????????
?
Fdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/ShapeShapehdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape_2*
T0*
_output_shapes
:
?
Tdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
?
Vdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
?
Vdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
Ndnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_sliceStridedSliceFdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/ShapeTdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_slice/stackVdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_slice/stack_1Vdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_slice/stack_2*
_output_shapes
: *
shrink_axis_mask*
T0*
Index0
?
Pdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/Reshape/shape/1Const*
dtype0*
_output_shapes
: *
value	B :
?
Ndnn/input_from_feature_columns/input_layer/alcohol_use_embedding/Reshape/shapePackNdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/strided_slicePdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/Reshape/shape/1*
T0*
N*
_output_shapes
:
?
Hdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/ReshapeReshapehdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_embedding_weights/Reshape_2Ndnn/input_from_feature_columns/input_layer/alcohol_use_embedding/Reshape/shape*'
_output_shapes
:?????????*
T0
?
adnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/ignore_value/xConst*
valueB B *
dtype0*
_output_shapes
: 
?
[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/NotEqualNotEqual
ExpandDimsadnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/ignore_value/x*
T0*'
_output_shapes
:?????????
?
Zdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/indicesWhere[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/NotEqual*'
_output_shapes
:?????????
?
Ydnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/valuesGatherNd
ExpandDimsZdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/indices*#
_output_shapes
:?????????*
Tindices0	*
Tparams0
?
^dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/dense_shapeShape
ExpandDims*
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
]dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/rangeRangecdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/range/start\dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/Sizecdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/range/delta*
_output_shapes
:
?
_dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/ToInt64Cast]dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/range*

SrcT0*
_output_shapes
:*

DstT0	
?
hdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/hash_table/ConstConst*
valueB	 R
?????????*
dtype0	*
_output_shapes
: 
?
bdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/hash_tableHashTableV2*
	key_dtype0*
value_dtype0	*
_output_shapes
: 
?
mdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/hash_table/table_initLookupTableImportV2bdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/hash_table]dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/Const_dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/ToInt64*	
Tin0*

Tout0	
?
Tdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/hash_table_LookupLookupTableFindV2bdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/hash_tableYdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/valueshdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/hash_table/Const*

Tout0	*#
_output_shapes
:?????????*	
Tin0
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
?
gdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/ProdProdhdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slicehdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Const*
_output_shapes
: *
T0	
?
sdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2/indicesConst*
value	B :*
dtype0*
_output_shapes
: 
?
pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
?
kdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2GatherV2^dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/dense_shapesdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2/indicespdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2/axis*
Taxis0*
Tindices0*
Tparams0	*
_output_shapes
: 
?
idnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Cast/xPackgdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Prodkdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2*
T0	*
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
hdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/WhereWhereodnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GreaterEqual*'
_output_shapes
:?????????
?
pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape/shapeConst*
valueB:
?????????*
dtype0*
_output_shapes
:
?
jdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/ReshapeReshapehdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Wherepdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape/shape*
T0	*#
_output_shapes
:?????????
?
rdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 
?
mdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2_1GatherV2pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseReshapejdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshaperdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2_1/axis*
Taxis0*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????
?
rdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2_2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
?
mdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2_2GatherV2ydnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseReshape/Identityjdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshaperdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/GatherV2_2/axis*
Tindices0	*
Tparams0	*#
_output_shapes
:?????????*
Taxis0
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
dtype0*
_output_shapes
:*
valueB"        
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlice?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
Index0*
T0	*
shrink_axis_mask*

begin_mask*
end_mask*#
_output_shapes
:?????????
?
dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/CastCast?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*#
_output_shapes
:?????????*

DstT0
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/UniqueUnique?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*2
_output_shapes 
:?????????:?????????*
T0	
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/axisConst*
value	B : *n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/embedding_lookupGatherV2`dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0/read?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/Unique?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/axis*
Tindices0	*
Tparams0*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*'
_output_shapes
:?????????*
Taxis0
?
?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentity?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/embedding_lookup*'
_output_shapes
:?????????*
T0
?
zdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparseSparseSegmentMean?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity?dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/Unique:1dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse/Cast*
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
*'
_output_shapes
:?????????
?
hdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/ShapeShapezdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/embedding_lookup_sparse*
T0*
_output_shapes
:
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
pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/strided_sliceStridedSlicehdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Shapevdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/strided_slice/stackxdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/strided_slice/stack_1xdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/strided_slice/stack_2*
shrink_axis_mask*
Index0*
T0*
_output_shapes
: 
?
jdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
?
hdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/stackPackjdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/stack/0pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/strided_slice*
T0*
N*
_output_shapes
:
?
gdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/TileTileldnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape_1hdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/stack*
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
idnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Cast_1Cast^dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/to_sparse_input/dense_shape*

SrcT0	*
_output_shapes
:*

DstT0
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
?
jdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Shape_1Shapebdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights*
T0*
_output_shapes
:
?
pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB:
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
:
?
ldnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape_2Reshapebdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weightsidnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/concat*'
_output_shapes
:?????????*
T0
?
Hdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/ShapeShapeldnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape_2*
T0*
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
?
Pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/strided_sliceStridedSliceHdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/ShapeVdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/strided_slice/stackXdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/strided_slice/stack_1Xdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/strided_slice/stack_2*
shrink_axis_mask*
T0*
Index0*
_output_shapes
: 
?
Rdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
?
Pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/Reshape/shapePackPdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/strided_sliceRdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/Reshape/shape/1*
T0*
N*
_output_shapes
:
?
Jdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/ReshapeReshapeldnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_embedding_weights/Reshape_2Pdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/Reshape/shape*'
_output_shapes
:?????????*
T0
|
@dnn/input_from_feature_columns/input_layer/gestation_weeks/ShapeShapeExpandDims_1*
T0*
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
Pdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
Hdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_sliceStridedSlice@dnn/input_from_feature_columns/input_layer/gestation_weeks/ShapeNdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stackPdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stack_1Pdnn/input_from_feature_columns/input_layer/gestation_weeks/strided_slice/stack_2*
shrink_axis_mask*
Index0*
T0*
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
T0*
N*
_output_shapes
:
?
Bdnn/input_from_feature_columns/input_layer/gestation_weeks/ReshapeReshapeExpandDims_1Hdnn/input_from_feature_columns/input_layer/gestation_weeks/Reshape/shape*'
_output_shapes
:?????????*
T0
?
[dnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/ignore_value/xConst*
valueB B *
dtype0*
_output_shapes
: 
?
Udnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/NotEqualNotEqualExpandDims_2[dnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/ignore_value/x*
T0*'
_output_shapes
:?????????
?
Tdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/indicesWhereUdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/NotEqual*'
_output_shapes
:?????????
?
Sdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/valuesGatherNdExpandDims_2Tdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/indices*
Tindices0	*
Tparams0*#
_output_shapes
:?????????
?
Xdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/dense_shapeShapeExpandDims_2*
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
Wdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
?
Qdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/rangeRangeWdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/range/startPdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/SizeWdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/range/delta*
_output_shapes
:
?
Sdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/ToInt64CastQdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/range*

SrcT0*
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
Vdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/hash_tableHashTableV2*
	key_dtype0*
value_dtype0	*
_output_shapes
: 
?
adnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/hash_table/table_initLookupTableImportV2Vdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/hash_tableQdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/ConstSdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/ToInt64*	
Tin0*

Tout0	
?
Ndnn/input_from_feature_columns/input_layer/is_male_embedding/hash_table_LookupLookupTableFindV2Vdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/hash_tableSdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/values\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/hash_table/Const*#
_output_shapes
:?????????*	
Tin0*

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
[dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/ProdProd\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Const*
T0	*
_output_shapes
: 
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
T0	*
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
\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/WhereWherecdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GreaterEqual*'
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
T0	*#
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
adnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2_2GatherV2mdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseReshape/Identity^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshapefdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/GatherV2_2/axis*#
_output_shapes
:?????????*
Taxis0*
Tindices0	*
Tparams0	
?
_dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/IdentityIdentityfdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseReshape:1*
T0	*
_output_shapes
:
?
pdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 
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
|dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlice~dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/strided_slice/stack?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
end_mask*#
_output_shapes
:?????????*
Index0*
T0	*
shrink_axis_mask*

begin_mask
?
sdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/CastCast|dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*#
_output_shapes
:?????????*

DstT0
?
udnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/UniqueUnique?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*2
_output_shapes 
:?????????:?????????*
T0	
?
?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/embedding_lookup/axisConst*
value	B : *h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
dtype0*
_output_shapes
: 
?
dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/embedding_lookupGatherV2Zdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0/readudnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/Unique?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/embedding_lookup/axis*
Tparams0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*'
_output_shapes
:?????????*
Taxis0*
Tindices0	
?
?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentitydnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:?????????
?
ndnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparseSparseSegmentMean?dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identitywdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/Unique:1sdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse/Cast*
T0*'
_output_shapes
:?????????
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

?
\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/ShapeShapendnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/embedding_lookup_sparse*
T0*
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
?
ddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/strided_sliceStridedSlice\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Shapejdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/strided_slice/stackldnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/strided_slice/stack_1ldnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/strided_slice/stack_2*
T0*
Index0*
_output_shapes
: *
shrink_axis_mask
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
T0
?
[dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/TileTile`dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshape_1\dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/stack*
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
?
]dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Cast_1CastXdnn/input_from_feature_columns/input_layer/is_male_embedding/to_sparse_input/dense_shape*

SrcT0	*
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
^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_1Slice]dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Cast_1ddnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_1/begincdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Slice_1/size*
Index0*
T0*
_output_shapes
:
?
^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Shape_1ShapeVdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights*
_output_shapes
:*
T0
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
:
?
`dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshape_2ReshapeVdnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights]dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/concat*'
_output_shapes
:?????????*
T0
?
Bdnn/input_from_feature_columns/input_layer/is_male_embedding/ShapeShape`dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshape_2*
T0*
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
Rdnn/input_from_feature_columns/input_layer/is_male_embedding/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
Jdnn/input_from_feature_columns/input_layer/is_male_embedding/strided_sliceStridedSliceBdnn/input_from_feature_columns/input_layer/is_male_embedding/ShapePdnn/input_from_feature_columns/input_layer/is_male_embedding/strided_slice/stackRdnn/input_from_feature_columns/input_layer/is_male_embedding/strided_slice/stack_1Rdnn/input_from_feature_columns/input_layer/is_male_embedding/strided_slice/stack_2*
shrink_axis_mask*
T0*
Index0*
_output_shapes
: 
?
Ldnn/input_from_feature_columns/input_layer/is_male_embedding/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
?
Jdnn/input_from_feature_columns/input_layer/is_male_embedding/Reshape/shapePackJdnn/input_from_feature_columns/input_layer/is_male_embedding/strided_sliceLdnn/input_from_feature_columns/input_layer/is_male_embedding/Reshape/shape/1*
T0*
N*
_output_shapes
:
?
Ddnn/input_from_feature_columns/input_layer/is_male_embedding/ReshapeReshape`dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_embedding_weights/Reshape_2Jdnn/input_from_feature_columns/input_layer/is_male_embedding/Reshape/shape*'
_output_shapes
:?????????*
T0
w
;dnn/input_from_feature_columns/input_layer/mother_age/ShapeShapeExpandDims_7*
T0*
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
?
Cdnn/input_from_feature_columns/input_layer/mother_age/strided_sliceStridedSlice;dnn/input_from_feature_columns/input_layer/mother_age/ShapeIdnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stackKdnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stack_1Kdnn/input_from_feature_columns/input_layer/mother_age/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
?
Ednn/input_from_feature_columns/input_layer/mother_age/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
?
Cdnn/input_from_feature_columns/input_layer/mother_age/Reshape/shapePackCdnn/input_from_feature_columns/input_layer/mother_age/strided_sliceEdnn/input_from_feature_columns/input_layer/mother_age/Reshape/shape/1*
T0*
N*
_output_shapes
:
?
=dnn/input_from_feature_columns/input_layer/mother_age/ReshapeReshapeExpandDims_7Cdnn/input_from_feature_columns/input_layer/mother_age/Reshape/shape*
T0*'
_output_shapes
:?????????
?
bdnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/ignore_value/xConst*
valueB B *
dtype0*
_output_shapes
: 
?
\dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/NotEqualNotEqualExpandDims_6bdnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/ignore_value/x*
T0*'
_output_shapes
:?????????
?
[dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/indicesWhere\dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/NotEqual*'
_output_shapes
:?????????
?
Zdnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/valuesGatherNdExpandDims_6[dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/indices*
Tindices0	*
Tparams0*#
_output_shapes
:?????????
?
_dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/dense_shapeShapeExpandDims_6*
_output_shapes
:*
T0*
out_type0	
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
_dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/rangeRangeednn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/range/start^dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/Sizeednn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/range/delta*
_output_shapes
:
?
adnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/ToInt64Cast_dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/range*

SrcT0*
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
value_dtype0	*
	key_dtype0*
_output_shapes
: 
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
jdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/ConstConst*
valueB: *
dtype0*
_output_shapes
:
?
idnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/ProdProdjdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slicejdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Const*
T0	*
_output_shapes
: 
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
mdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2GatherV2_dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/dense_shapeudnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2/indicesrdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2/axis*
_output_shapes
: *
Taxis0*
Tindices0*
Tparams0	
?
kdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Cast/xPackidnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Prodmdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2*
N*
_output_shapes
:*
T0	
?
rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseReshapeSparseReshape[dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/indices_dnn/input_from_feature_columns/input_layer/mother_married_embedding/to_sparse_input/dense_shapekdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Cast/x*-
_output_shapes
:?????????:
?
{dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseReshape/IdentityIdentityUdnn/input_from_feature_columns/input_layer/mother_married_embedding/hash_table_Lookup*#
_output_shapes
:?????????*
T0	
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
jdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/WhereWhereqdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GreaterEqual*'
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
T0	*#
_output_shapes
:?????????
?
tdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 
?
odnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2_1GatherV2rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseReshapeldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshapetdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2_1/axis*'
_output_shapes
:?????????*
Taxis0*
Tindices0	*
Tparams0	
?
tdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/GatherV2_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
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
~dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 
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
dtype0*
_output_shapes
:*
valueB"      
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlice?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/strided_slice/stack?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*

begin_mask*
end_mask*#
_output_shapes
:?????????*
T0	*
Index0*
shrink_axis_mask
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/CastCast?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*#
_output_shapes
:?????????*

DstT0
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/UniqueUnique?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*2
_output_shapes 
:?????????:?????????
?
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/embedding_lookup/axisConst*
dtype0*
_output_shapes
: *
value	B : *o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0
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
?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentity?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/embedding_lookup*'
_output_shapes
:?????????*
T0
?
|dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparseSparseSegmentMean?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identity?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/Unique:1?dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse/Cast*
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
*'
_output_shapes
:?????????
?
jdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/ShapeShape|dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/embedding_lookup_sparse*
T0*
_output_shapes
:
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
rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/strided_sliceStridedSlicejdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Shapexdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/strided_slice/stackzdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/strided_slice/stack_1zdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/strided_slice/stack_2*
T0*
Index0*
_output_shapes
: *
shrink_axis_mask
?
ldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
?
jdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/stackPackldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/stack/0rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/strided_slice*
T0*
N*
_output_shapes
:
?
idnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/TileTilendnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshape_1jdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/stack*
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

SrcT0	*
_output_shapes
:*

DstT0
?
rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:
?
qdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
?
ldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_1Slicekdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Cast_1rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_1/beginqdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_1/size*
Index0*
T0*
_output_shapes
:
?
ldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Shape_1Shapeddnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights*
T0*
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
valueB:
?????????*
dtype0*
_output_shapes
:
?
ldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_2Sliceldnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Shape_1rdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_2/beginqdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Slice_2/size*
_output_shapes
:*
Index0*
T0
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
:
?
ndnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshape_2Reshapeddnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weightskdnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/concat*
T0*'
_output_shapes
:?????????
?
Idnn/input_from_feature_columns/input_layer/mother_married_embedding/ShapeShapendnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshape_2*
T0*
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
Ydnn/input_from_feature_columns/input_layer/mother_married_embedding/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
Qdnn/input_from_feature_columns/input_layer/mother_married_embedding/strided_sliceStridedSliceIdnn/input_from_feature_columns/input_layer/mother_married_embedding/ShapeWdnn/input_from_feature_columns/input_layer/mother_married_embedding/strided_slice/stackYdnn/input_from_feature_columns/input_layer/mother_married_embedding/strided_slice/stack_1Ydnn/input_from_feature_columns/input_layer/mother_married_embedding/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
?
Sdnn/input_from_feature_columns/input_layer/mother_married_embedding/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
?
Qdnn/input_from_feature_columns/input_layer/mother_married_embedding/Reshape/shapePackQdnn/input_from_feature_columns/input_layer/mother_married_embedding/strided_sliceSdnn/input_from_feature_columns/input_layer/mother_married_embedding/Reshape/shape/1*
T0*
N*
_output_shapes
:
?
Kdnn/input_from_feature_columns/input_layer/mother_married_embedding/ReshapeReshapendnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_embedding_weights/Reshape_2Qdnn/input_from_feature_columns/input_layer/mother_married_embedding/Reshape/shape*'
_output_shapes
:?????????*
T0
?
_dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/ignore_value/xConst*
valueB B *
dtype0*
_output_shapes
: 
?
Ydnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/NotEqualNotEqualExpandDims_3_dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/ignore_value/x*
T0*'
_output_shapes
:?????????
?
Xdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/indicesWhereYdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/NotEqual*'
_output_shapes
:?????????
?
Wdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/valuesGatherNdExpandDims_3Xdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/indices*
Tindices0	*
Tparams0*#
_output_shapes
:?????????
?
\dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/dense_shapeShapeExpandDims_3*
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
_dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
Ydnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/rangeRange_dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range/startXdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/Size_dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range/delta*
_output_shapes
:
?
[dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/ToInt64CastYdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/range*

SrcT0*
_output_shapes
:*

DstT0	
?
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_table/ConstConst*
valueB	 R
?????????*
dtype0	*
_output_shapes
: 
?
^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_tableHashTableV2*
value_dtype0	*
	key_dtype0*
_output_shapes
: 
?
idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_table/table_initLookupTableImportV2^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_tableYdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/Const[dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/ToInt64*	
Tin0*

Tout0	
?
Rdnn/input_from_feature_columns/input_layer/mother_race_embedding/hash_table_LookupLookupTableFindV2^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_tableWdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/valuesddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_table/Const*#
_output_shapes
:?????????*	
Tin0*

Tout0	
?
jdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice/beginConst*
dtype0*
_output_shapes
:*
valueB: 
?
idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
?
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SliceSlice\dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/dense_shapejdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice/beginidnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice/size*
_output_shapes
:*
Index0*
T0	
?
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/ConstConst*
valueB: *
dtype0*
_output_shapes
:
?
cdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/ProdProdddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Sliceddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Const*
_output_shapes
: *
T0	
?
odnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2/indicesConst*
dtype0*
_output_shapes
: *
value	B :
?
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
gdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2GatherV2\dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/dense_shapeodnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2/indicesldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2/axis*
_output_shapes
: *
Taxis0*
Tindices0*
Tparams0	
?
ednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Cast/xPackcdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Prodgdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2*
T0	*
N*
_output_shapes
:
?
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshapeSparseReshapeXdnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/indices\dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/dense_shapeednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Cast/x*-
_output_shapes
:?????????:
?
udnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshape/IdentityIdentityRdnn/input_from_feature_columns/input_layer/mother_race_embedding/hash_table_Lookup*
T0	*#
_output_shapes
:?????????
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
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/WhereWherekdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GreaterEqual*'
_output_shapes
:?????????
?
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
?????????
?
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/ReshapeReshapeddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Whereldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape/shape*
T0	*#
_output_shapes
:?????????
?
ndnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 
?
idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2_1GatherV2ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshapefdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshapendnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2_1/axis*
Tindices0	*
Tparams0	*'
_output_shapes
:?????????*
Taxis0
?
ndnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2_2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
?
idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2_2GatherV2udnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseReshape/Identityfdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshapendnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/GatherV2_2/axis*#
_output_shapes
:?????????*
Taxis0*
Tindices0	*
Tparams0	
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
valueB"      *
dtype0*
_output_shapes
:
?
?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_sliceStridedSlice?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stack?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stack_1?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice/stack_2*
Index0*
T0	*
shrink_axis_mask*

begin_mask*
end_mask*#
_output_shapes
:?????????
?
{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/CastCast?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/strided_slice*#
_output_shapes
:?????????*

DstT0*

SrcT0	
?
}dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/UniqueUnique?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:1*
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
?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/embedding_lookupGatherV2^dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0/read}dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/Unique?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/embedding_lookup/axis*
Tparams0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*'
_output_shapes
:?????????*
Taxis0*
Tindices0	
?
?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/embedding_lookup/IdentityIdentity?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/embedding_lookup*
T0*'
_output_shapes
:?????????
?
vdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparseSparseSegmentMean?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/embedding_lookup/Identitydnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/Unique:1{dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse/Cast*
T0*'
_output_shapes
:?????????
?
ndnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"????   
?
hdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_1Reshape?dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/SparseFillEmptyRows/SparseFillEmptyRows:2ndnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_1/shape*
T0
*'
_output_shapes
:?????????
?
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/ShapeShapevdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/embedding_lookup_sparse*
T0*
_output_shapes
:
?
rdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:
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
ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_sliceStridedSliceddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Shaperdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stacktdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stack_1tdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice/stack_2*
shrink_axis_mask*
Index0*
T0*
_output_shapes
: 
?
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/stack/0Const*
dtype0*
_output_shapes
: *
value	B :
?
ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/stackPackfdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/stack/0ldnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/strided_slice*
T0*
N*
_output_shapes
:
?
cdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/TileTilehdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_1ddnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/stack*
T0
*0
_output_shapes
:??????????????????
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
?
ednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Cast_1Cast\dnn/input_from_feature_columns/input_layer/mother_race_embedding/to_sparse_input/dense_shape*

SrcT0	*
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
?
fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Shape_1Shape^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights*
T0*
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
jdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
?
ednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/concatConcatV2fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_1fdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Slice_2jdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/concat/axis*
T0*
N*
_output_shapes
:
?
hdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_2Reshape^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weightsednn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/concat*
T0*'
_output_shapes
:?????????
?
Fdnn/input_from_feature_columns/input_layer/mother_race_embedding/ShapeShapehdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_2*
_output_shapes
:*
T0
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
?
Ndnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_sliceStridedSliceFdnn/input_from_feature_columns/input_layer/mother_race_embedding/ShapeTdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stackVdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stack_1Vdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slice/stack_2*
_output_shapes
: *
shrink_axis_mask*
T0*
Index0
?
Pdnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape/shape/1Const*
dtype0*
_output_shapes
: *
value	B :
?
Ndnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape/shapePackNdnn/input_from_feature_columns/input_layer/mother_race_embedding/strided_slicePdnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape/shape/1*
T0*
N*
_output_shapes
:
?
Hdnn/input_from_feature_columns/input_layer/mother_race_embedding/ReshapeReshapehdnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_embedding_weights/Reshape_2Ndnn/input_from_feature_columns/input_layer/mother_race_embedding/Reshape/shape*
T0*'
_output_shapes
:?????????
v
:dnn/input_from_feature_columns/input_layer/plurality/ShapeShapeExpandDims_4*
_output_shapes
:*
T0
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
?
Bdnn/input_from_feature_columns/input_layer/plurality/strided_sliceStridedSlice:dnn/input_from_feature_columns/input_layer/plurality/ShapeHdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stackJdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stack_1Jdnn/input_from_feature_columns/input_layer/plurality/strided_slice/stack_2*
_output_shapes
: *
shrink_axis_mask*
T0*
Index0
?
Ddnn/input_from_feature_columns/input_layer/plurality/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
?
Bdnn/input_from_feature_columns/input_layer/plurality/Reshape/shapePackBdnn/input_from_feature_columns/input_layer/plurality/strided_sliceDdnn/input_from_feature_columns/input_layer/plurality/Reshape/shape/1*
T0*
N*
_output_shapes
:
?
<dnn/input_from_feature_columns/input_layer/plurality/ReshapeReshapeExpandDims_4Bdnn/input_from_feature_columns/input_layer/plurality/Reshape/shape*
T0*'
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
:?????????
?
@dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"       *2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0
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
Hdnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/shape*
seedޱ?	*
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
seed2?*
dtype0*
_output_shapes

: 
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
:dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_0/kernel/part_0/Initializer/random_uniform/min*
_output_shapes

: *
T0*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0
?
dnn/hiddenlayer_0/kernel/part_0VarHandleOp*2
_class(
&$loc:@dnn/hiddenlayer_0/kernel/part_0*
dtype0*
_output_shapes
: *
shape
: *0
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
dnn/hiddenlayer_0/bias/part_0VarHandleOp*.
shared_namednn/hiddenlayer_0/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_0/bias/part_0*
dtype0*
_output_shapes
: *
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
dnn/hiddenlayer_0/kernelIdentity'dnn/hiddenlayer_0/kernel/ReadVariableOp*
_output_shapes

: *
T0
?
dnn/hiddenlayer_0/MatMulMatMul1dnn/input_from_feature_columns/input_layer/concatdnn/hiddenlayer_0/kernel*
T0*'
_output_shapes
:????????? 
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
dnn/hiddenlayer_0/BiasAddBiasAdddnn/hiddenlayer_0/MatMuldnn/hiddenlayer_0/bias*'
_output_shapes
:????????? *
T0
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
*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0VarHandleOp*
shape: *;
shared_name,*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*=
_class3
1/loc:@dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*
dtype0*
_output_shapes
: 
?
Kdnn/hiddenlayer_0/batchnorm_0/gamma/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*
_output_shapes
: 
?
1dnn/hiddenlayer_0/batchnorm_0/gamma/part_0/AssignAssignVariableOp*dnn/hiddenlayer_0/batchnorm_0/gamma/part_0;dnn/hiddenlayer_0/batchnorm_0/gamma/part_0/Initializer/ones*=
_class3
1/loc:@dnn/hiddenlayer_0/batchnorm_0/gamma/part_0*
dtype0
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
)dnn/hiddenlayer_0/batchnorm_0/beta/part_0VarHandleOp*
dtype0*
_output_shapes
: *
shape: *:
shared_name+)dnn/hiddenlayer_0/batchnorm_0/beta/part_0*<
_class2
0.loc:@dnn/hiddenlayer_0/batchnorm_0/beta/part_0
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
;dnn/hiddenlayer_0/batchnorm_0/moving_mean/Initializer/zerosConst*
dtype0*
_output_shapes
: *
valueB *    *<
_class2
0.loc:@dnn/hiddenlayer_0/batchnorm_0/moving_mean
?
)dnn/hiddenlayer_0/batchnorm_0/moving_meanVarHandleOp*
dtype0*
_output_shapes
: *
shape: *:
shared_name+)dnn/hiddenlayer_0/batchnorm_0/moving_mean*<
_class2
0.loc:@dnn/hiddenlayer_0/batchnorm_0/moving_mean
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
>dnn/hiddenlayer_0/batchnorm_0/moving_variance/Initializer/onesConst*
dtype0*
_output_shapes
: *
valueB *  ??*@
_class6
42loc:@dnn/hiddenlayer_0/batchnorm_0/moving_variance
?
-dnn/hiddenlayer_0/batchnorm_0/moving_varianceVarHandleOp*>
shared_name/-dnn/hiddenlayer_0/batchnorm_0/moving_variance*@
_class6
42loc:@dnn/hiddenlayer_0/batchnorm_0/moving_variance*
dtype0*
_output_shapes
: *
shape: 
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
"dnn/hiddenlayer_0/batchnorm_0/betaIdentity1dnn/hiddenlayer_0/batchnorm_0/beta/ReadVariableOp*
T0*
_output_shapes
: 
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
-dnn/hiddenlayer_0/batchnorm_0/batchnorm/mul_2Mul8dnn/hiddenlayer_0/batchnorm_0/batchnorm/ReadVariableOp_1+dnn/hiddenlayer_0/batchnorm_0/batchnorm/mul*
_output_shapes
: *
T0
?
+dnn/hiddenlayer_0/batchnorm_0/batchnorm/subSub"dnn/hiddenlayer_0/batchnorm_0/beta-dnn/hiddenlayer_0/batchnorm_0/batchnorm/mul_2*
T0*
_output_shapes
: 
?
-dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1Add-dnn/hiddenlayer_0/batchnorm_0/batchnorm/mul_1+dnn/hiddenlayer_0/batchnorm_0/batchnorm/sub*'
_output_shapes
:????????? *
T0
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
dnn/zero_fraction/cond/switch_fIdentitydnn/zero_fraction/cond/Switch*
T0
*
_output_shapes
: 
h
dnn/zero_fraction/cond/pred_idIdentitydnn/zero_fraction/LessEqual*
_output_shapes
: *
T0

?
*dnn/zero_fraction/cond/count_nonzero/zerosConst ^dnn/zero_fraction/cond/switch_t*
dtype0*
_output_shapes
: *
valueB
 *    
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
*'
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
: *
T0
?
dnn/zero_fraction/cond/CastCast2dnn/zero_fraction/cond/count_nonzero/nonzero_count*
_output_shapes
: *

DstT0	*

SrcT0
?
,dnn/zero_fraction/cond/count_nonzero_1/zerosConst ^dnn/zero_fraction/cond/switch_f*
valueB
 *    *
dtype0*
_output_shapes
: 
?
/dnn/zero_fraction/cond/count_nonzero_1/NotEqualNotEqual6dnn/zero_fraction/cond/count_nonzero_1/NotEqual/Switch,dnn/zero_fraction/cond/count_nonzero_1/zeros*'
_output_shapes
:????????? *
T0
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
*'
_output_shapes
:????????? *

DstT0	
?
,dnn/zero_fraction/cond/count_nonzero_1/ConstConst ^dnn/zero_fraction/cond/switch_f*
valueB"       *
dtype0*
_output_shapes
:
?
4dnn/zero_fraction/cond/count_nonzero_1/nonzero_countSum+dnn/zero_fraction/cond/count_nonzero_1/Cast,dnn/zero_fraction/cond/count_nonzero_1/Const*
T0	*
_output_shapes
: 
?
dnn/zero_fraction/cond/MergeMerge4dnn/zero_fraction/cond/count_nonzero_1/nonzero_countdnn/zero_fraction/cond/Cast*
N*
_output_shapes
: : *
T0	
?
(dnn/zero_fraction/counts_to_fraction/subSubdnn/zero_fraction/Sizednn/zero_fraction/cond/Merge*
T0	*
_output_shapes
: 
?
)dnn/zero_fraction/counts_to_fraction/CastCast(dnn/zero_fraction/counts_to_fraction/sub*

SrcT0	*
_output_shapes
: *

DstT0
{
+dnn/zero_fraction/counts_to_fraction/Cast_1Castdnn/zero_fraction/Size*

SrcT0	*
_output_shapes
: *

DstT0
?
,dnn/zero_fraction/counts_to_fraction/truedivRealDiv)dnn/zero_fraction/counts_to_fraction/Cast+dnn/zero_fraction/counts_to_fraction/Cast_1*
T0*
_output_shapes
: 
u
dnn/zero_fraction/fractionIdentity,dnn/zero_fraction/counts_to_fraction/truediv*
_output_shapes
: *
T0
?
2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsConst*>
value5B3 B-dnn/dnn/hiddenlayer_0/fraction_of_zero_values*
dtype0*
_output_shapes
: 
?
-dnn/dnn/hiddenlayer_0/fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_0/fraction_of_zero_values/tagsdnn/zero_fraction/fraction*
_output_shapes
: *
T0
?
$dnn/dnn/hiddenlayer_0/activation/tagConst*1
value(B& B dnn/dnn/hiddenlayer_0/activation*
dtype0*
_output_shapes
: 
?
 dnn/dnn/hiddenlayer_0/activationHistogramSummary$dnn/dnn/hiddenlayer_0/activation/tag-dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1*
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
>dnn/hiddenlayer_1/kernel/part_0/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *????*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0
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
seedޱ?	*
T0*2
_class(
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
seed2?*
dtype0*
_output_shapes

: 
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
&$loc:@dnn/hiddenlayer_1/kernel/part_0*
dtype0*
_output_shapes
: *
shape
: 
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
dnn/hiddenlayer_1/bias/part_0VarHandleOp*
shape:*.
shared_namednn/hiddenlayer_1/bias/part_0*0
_class&
$"loc:@dnn/hiddenlayer_1/bias/part_0*
dtype0*
_output_shapes
: 
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
dnn/hiddenlayer_1/kernelIdentity'dnn/hiddenlayer_1/kernel/ReadVariableOp*
_output_shapes

: *
T0
?
dnn/hiddenlayer_1/MatMulMatMul-dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1dnn/hiddenlayer_1/kernel*
T0*'
_output_shapes
:?????????
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
T0*'
_output_shapes
:?????????
k
dnn/hiddenlayer_1/ReluReludnn/hiddenlayer_1/BiasAdd*
T0*'
_output_shapes
:?????????
?
;dnn/hiddenlayer_1/batchnorm_1/gamma/part_0/Initializer/onesConst*
dtype0*
_output_shapes
:*
valueB*  ??*=
_class3
1/loc:@dnn/hiddenlayer_1/batchnorm_1/gamma/part_0
?
*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0VarHandleOp*;
shared_name,*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*=
_class3
1/loc:@dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*
dtype0*
_output_shapes
: *
shape:
?
Kdnn/hiddenlayer_1/batchnorm_1/gamma/part_0/IsInitialized/VarIsInitializedOpVarIsInitializedOp*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*
_output_shapes
: 
?
1dnn/hiddenlayer_1/batchnorm_1/gamma/part_0/AssignAssignVariableOp*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0;dnn/hiddenlayer_1/batchnorm_1/gamma/part_0/Initializer/ones*
dtype0*=
_class3
1/loc:@dnn/hiddenlayer_1/batchnorm_1/gamma/part_0
?
>dnn/hiddenlayer_1/batchnorm_1/gamma/part_0/Read/ReadVariableOpReadVariableOp*dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*=
_class3
1/loc:@dnn/hiddenlayer_1/batchnorm_1/gamma/part_0*
dtype0*
_output_shapes
:
?
;dnn/hiddenlayer_1/batchnorm_1/beta/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *<
_class2
0.loc:@dnn/hiddenlayer_1/batchnorm_1/beta/part_0
?
)dnn/hiddenlayer_1/batchnorm_1/beta/part_0VarHandleOp*
dtype0*
_output_shapes
: *
shape:*:
shared_name+)dnn/hiddenlayer_1/batchnorm_1/beta/part_0*<
_class2
0.loc:@dnn/hiddenlayer_1/batchnorm_1/beta/part_0
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
: *
shape:*:
shared_name+)dnn/hiddenlayer_1/batchnorm_1/moving_mean*<
_class2
0.loc:@dnn/hiddenlayer_1/batchnorm_1/moving_mean
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
?
-dnn/hiddenlayer_1/batchnorm_1/moving_varianceVarHandleOp*@
_class6
42loc:@dnn/hiddenlayer_1/batchnorm_1/moving_variance*
dtype0*
_output_shapes
: *
shape:*>
shared_name/-dnn/hiddenlayer_1/batchnorm_1/moving_variance
?
Ndnn/hiddenlayer_1/batchnorm_1/moving_variance/IsInitialized/VarIsInitializedOpVarIsInitializedOp-dnn/hiddenlayer_1/batchnorm_1/moving_variance*
_output_shapes
: 
?
4dnn/hiddenlayer_1/batchnorm_1/moving_variance/AssignAssignVariableOp-dnn/hiddenlayer_1/batchnorm_1/moving_variance>dnn/hiddenlayer_1/batchnorm_1/moving_variance/Initializer/ones*
dtype0*@
_class6
42loc:@dnn/hiddenlayer_1/batchnorm_1/moving_variance
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
-dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1Add-dnn/hiddenlayer_1/batchnorm_1/batchnorm/mul_1+dnn/hiddenlayer_1/batchnorm_1/batchnorm/sub*
T0*'
_output_shapes
:?????????
?
dnn/zero_fraction_1/SizeSize-dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1*
_output_shapes
: *
T0*
out_type0	
e
dnn/zero_fraction_1/LessEqual/yConst*
dtype0	*
_output_shapes
: *
valueB	 R????
?
dnn/zero_fraction_1/LessEqual	LessEqualdnn/zero_fraction_1/Sizednn/zero_fraction_1/LessEqual/y*
_output_shapes
: *
T0	
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
,dnn/zero_fraction_1/cond/count_nonzero/zerosConst"^dnn/zero_fraction_1/cond/switch_t*
dtype0*
_output_shapes
: *
valueB
 *    
?
/dnn/zero_fraction_1/cond/count_nonzero/NotEqualNotEqual8dnn/zero_fraction_1/cond/count_nonzero/NotEqual/Switch:1,dnn/zero_fraction_1/cond/count_nonzero/zeros*'
_output_shapes
:?????????*
T0
?
6dnn/zero_fraction_1/cond/count_nonzero/NotEqual/SwitchSwitch-dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1 dnn/zero_fraction_1/cond/pred_id*
T0*@
_class6
42loc:@dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1*:
_output_shapes(
&:?????????:?????????
?
+dnn/zero_fraction_1/cond/count_nonzero/CastCast/dnn/zero_fraction_1/cond/count_nonzero/NotEqual*

SrcT0
*'
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
: 
?
dnn/zero_fraction_1/cond/CastCast4dnn/zero_fraction_1/cond/count_nonzero/nonzero_count*

SrcT0*
_output_shapes
: *

DstT0	
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
-dnn/zero_fraction_1/cond/count_nonzero_1/CastCast1dnn/zero_fraction_1/cond/count_nonzero_1/NotEqual*'
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
6dnn/zero_fraction_1/cond/count_nonzero_1/nonzero_countSum-dnn/zero_fraction_1/cond/count_nonzero_1/Cast.dnn/zero_fraction_1/cond/count_nonzero_1/Const*
_output_shapes
: *
T0	
?
dnn/zero_fraction_1/cond/MergeMerge6dnn/zero_fraction_1/cond/count_nonzero_1/nonzero_countdnn/zero_fraction_1/cond/Cast*
N*
_output_shapes
: : *
T0	
?
*dnn/zero_fraction_1/counts_to_fraction/subSubdnn/zero_fraction_1/Sizednn/zero_fraction_1/cond/Merge*
T0	*
_output_shapes
: 
?
+dnn/zero_fraction_1/counts_to_fraction/CastCast*dnn/zero_fraction_1/counts_to_fraction/sub*

SrcT0	*
_output_shapes
: *

DstT0

-dnn/zero_fraction_1/counts_to_fraction/Cast_1Castdnn/zero_fraction_1/Size*

SrcT0	*
_output_shapes
: *

DstT0
?
.dnn/zero_fraction_1/counts_to_fraction/truedivRealDiv+dnn/zero_fraction_1/counts_to_fraction/Cast-dnn/zero_fraction_1/counts_to_fraction/Cast_1*
_output_shapes
: *
T0
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
$dnn/dnn/hiddenlayer_1/activation/tagConst*1
value(B& B dnn/dnn/hiddenlayer_1/activation*
dtype0*
_output_shapes
: 
?
 dnn/dnn/hiddenlayer_1/activationHistogramSummary$dnn/dnn/hiddenlayer_1/activation/tag-dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1*
_output_shapes
: 
?
@dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/shapeConst*
valueB"      *2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes
:
?
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *?-ξ*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0
?
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *?-?>*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0
?
Hdnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/RandomUniformRandomUniform@dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/shape*
seed2?*
dtype0*
_output_shapes

:*
seedޱ?	*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0
?
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/subSub>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/max>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
_output_shapes
: 
?
>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/mulMulHdnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/RandomUniform>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/sub*
_output_shapes

:*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0
?
:dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniformAdd>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/mul>dnn/hiddenlayer_2/kernel/part_0/Initializer/random_uniform/min*
T0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
_output_shapes

:
?
dnn/hiddenlayer_2/kernel/part_0VarHandleOp*0
shared_name!dnn/hiddenlayer_2/kernel/part_0*2
_class(
&$loc:@dnn/hiddenlayer_2/kernel/part_0*
dtype0*
_output_shapes
: *
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
:*
valueB*    *0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0
?
dnn/hiddenlayer_2/bias/part_0VarHandleOp*0
_class&
$"loc:@dnn/hiddenlayer_2/bias/part_0*
dtype0*
_output_shapes
: *
shape:*.
shared_namednn/hiddenlayer_2/bias/part_0
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
dnn/hiddenlayer_2/kernelIdentity'dnn/hiddenlayer_2/kernel/ReadVariableOp*
_output_shapes

:*
T0
?
dnn/hiddenlayer_2/MatMulMatMul-dnn/hiddenlayer_1/batchnorm_1/batchnorm/add_1dnn/hiddenlayer_2/kernel*
T0*'
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
T0*'
_output_shapes
:?????????
k
dnn/hiddenlayer_2/ReluReludnn/hiddenlayer_2/BiasAdd*
T0*'
_output_shapes
:?????????
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
: *
shape:*;
shared_name,*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0*=
_class3
1/loc:@dnn/hiddenlayer_2/batchnorm_2/gamma/part_0
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
>dnn/hiddenlayer_2/batchnorm_2/gamma/part_0/Read/ReadVariableOpReadVariableOp*dnn/hiddenlayer_2/batchnorm_2/gamma/part_0*
dtype0*
_output_shapes
:*=
_class3
1/loc:@dnn/hiddenlayer_2/batchnorm_2/gamma/part_0
?
;dnn/hiddenlayer_2/batchnorm_2/beta/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *<
_class2
0.loc:@dnn/hiddenlayer_2/batchnorm_2/beta/part_0
?
)dnn/hiddenlayer_2/batchnorm_2/beta/part_0VarHandleOp*
dtype0*
_output_shapes
: *
shape:*:
shared_name+)dnn/hiddenlayer_2/batchnorm_2/beta/part_0*<
_class2
0.loc:@dnn/hiddenlayer_2/batchnorm_2/beta/part_0
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
)dnn/hiddenlayer_2/batchnorm_2/moving_meanVarHandleOp*:
shared_name+)dnn/hiddenlayer_2/batchnorm_2/moving_mean*<
_class2
0.loc:@dnn/hiddenlayer_2/batchnorm_2/moving_mean*
dtype0*
_output_shapes
: *
shape:
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
=dnn/hiddenlayer_2/batchnorm_2/moving_mean/Read/ReadVariableOpReadVariableOp)dnn/hiddenlayer_2/batchnorm_2/moving_mean*<
_class2
0.loc:@dnn/hiddenlayer_2/batchnorm_2/moving_mean*
dtype0*
_output_shapes
:
?
>dnn/hiddenlayer_2/batchnorm_2/moving_variance/Initializer/onesConst*
valueB*  ??*@
_class6
42loc:@dnn/hiddenlayer_2/batchnorm_2/moving_variance*
dtype0*
_output_shapes
:
?
-dnn/hiddenlayer_2/batchnorm_2/moving_varianceVarHandleOp*
shape:*>
shared_name/-dnn/hiddenlayer_2/batchnorm_2/moving_variance*@
_class6
42loc:@dnn/hiddenlayer_2/batchnorm_2/moving_variance*
dtype0*
_output_shapes
: 
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
Adnn/hiddenlayer_2/batchnorm_2/moving_variance/Read/ReadVariableOpReadVariableOp-dnn/hiddenlayer_2/batchnorm_2/moving_variance*@
_class6
42loc:@dnn/hiddenlayer_2/batchnorm_2/moving_variance*
dtype0*
_output_shapes
:
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
-dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1Add-dnn/hiddenlayer_2/batchnorm_2/batchnorm/mul_1+dnn/hiddenlayer_2/batchnorm_2/batchnorm/sub*'
_output_shapes
:?????????*
T0
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
/dnn/zero_fraction_2/cond/count_nonzero/NotEqualNotEqual8dnn/zero_fraction_2/cond/count_nonzero/NotEqual/Switch:1,dnn/zero_fraction_2/cond/count_nonzero/zeros*'
_output_shapes
:?????????*
T0
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
*'
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
: *
T0
?
dnn/zero_fraction_2/cond/CastCast4dnn/zero_fraction_2/cond/count_nonzero/nonzero_count*

SrcT0*
_output_shapes
: *

DstT0	
?
.dnn/zero_fraction_2/cond/count_nonzero_1/zerosConst"^dnn/zero_fraction_2/cond/switch_f*
dtype0*
_output_shapes
: *
valueB
 *    
?
1dnn/zero_fraction_2/cond/count_nonzero_1/NotEqualNotEqual8dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual/Switch.dnn/zero_fraction_2/cond/count_nonzero_1/zeros*'
_output_shapes
:?????????*
T0
?
8dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual/SwitchSwitch-dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1 dnn/zero_fraction_2/cond/pred_id*
T0*@
_class6
42loc:@dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1*:
_output_shapes(
&:?????????:?????????
?
-dnn/zero_fraction_2/cond/count_nonzero_1/CastCast1dnn/zero_fraction_2/cond/count_nonzero_1/NotEqual*'
_output_shapes
:?????????*

DstT0	*

SrcT0

?
.dnn/zero_fraction_2/cond/count_nonzero_1/ConstConst"^dnn/zero_fraction_2/cond/switch_f*
valueB"       *
dtype0*
_output_shapes
:
?
6dnn/zero_fraction_2/cond/count_nonzero_1/nonzero_countSum-dnn/zero_fraction_2/cond/count_nonzero_1/Cast.dnn/zero_fraction_2/cond/count_nonzero_1/Const*
_output_shapes
: *
T0	
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
+dnn/zero_fraction_2/counts_to_fraction/CastCast*dnn/zero_fraction_2/counts_to_fraction/sub*
_output_shapes
: *

DstT0*

SrcT0	

-dnn/zero_fraction_2/counts_to_fraction/Cast_1Castdnn/zero_fraction_2/Size*

SrcT0	*
_output_shapes
: *

DstT0
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
$dnn/dnn/hiddenlayer_2/activation/tagConst*1
value(B& B dnn/dnn/hiddenlayer_2/activation*
dtype0*
_output_shapes
: 
?
 dnn/dnn/hiddenlayer_2/activationHistogramSummary$dnn/dnn/hiddenlayer_2/activation/tag-dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1*
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
7dnn/logits/kernel/part_0/Initializer/random_uniform/minConst*
valueB
 *q??*+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0*
_output_shapes
: 
?
7dnn/logits/kernel/part_0/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *q??*+
_class!
loc:@dnn/logits/kernel/part_0
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
dnn/logits/kernel/part_0VarHandleOp*
shape
:*)
shared_namednn/logits/kernel/part_0*+
_class!
loc:@dnn/logits/kernel/part_0*
dtype0*
_output_shapes
: 
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
(dnn/logits/bias/part_0/Initializer/zerosConst*
valueB*    *)
_class
loc:@dnn/logits/bias/part_0*
dtype0*
_output_shapes
:
?
dnn/logits/bias/part_0VarHandleOp*)
_class
loc:@dnn/logits/bias/part_0*
dtype0*
_output_shapes
: *
shape:*'
shared_namednn/logits/bias/part_0
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
dnn/logits/kernelIdentity dnn/logits/kernel/ReadVariableOp*
_output_shapes

:*
T0
?
dnn/logits/MatMulMatMul-dnn/hiddenlayer_2/batchnorm_2/batchnorm/add_1dnn/logits/kernel*
T0*'
_output_shapes
:?????????
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
s
dnn/logits/BiasAddBiasAdddnn/logits/MatMuldnn/logits/bias*'
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
 dnn/zero_fraction_3/cond/pred_idIdentitydnn/zero_fraction_3/LessEqual*
_output_shapes
: *
T0

?
,dnn/zero_fraction_3/cond/count_nonzero/zerosConst"^dnn/zero_fraction_3/cond/switch_t*
valueB
 *    *
dtype0*
_output_shapes
: 
?
/dnn/zero_fraction_3/cond/count_nonzero/NotEqualNotEqual8dnn/zero_fraction_3/cond/count_nonzero/NotEqual/Switch:1,dnn/zero_fraction_3/cond/count_nonzero/zeros*'
_output_shapes
:?????????*
T0
?
6dnn/zero_fraction_3/cond/count_nonzero/NotEqual/SwitchSwitchdnn/logits/BiasAdd dnn/zero_fraction_3/cond/pred_id*
T0*%
_class
loc:@dnn/logits/BiasAdd*:
_output_shapes(
&:?????????:?????????
?
+dnn/zero_fraction_3/cond/count_nonzero/CastCast/dnn/zero_fraction_3/cond/count_nonzero/NotEqual*'
_output_shapes
:?????????*

DstT0*

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
: 
?
dnn/zero_fraction_3/cond/CastCast4dnn/zero_fraction_3/cond/count_nonzero/nonzero_count*
_output_shapes
: *

DstT0	*

SrcT0
?
.dnn/zero_fraction_3/cond/count_nonzero_1/zerosConst"^dnn/zero_fraction_3/cond/switch_f*
valueB
 *    *
dtype0*
_output_shapes
: 
?
1dnn/zero_fraction_3/cond/count_nonzero_1/NotEqualNotEqual8dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual/Switch.dnn/zero_fraction_3/cond/count_nonzero_1/zeros*'
_output_shapes
:?????????*
T0
?
8dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual/SwitchSwitchdnn/logits/BiasAdd dnn/zero_fraction_3/cond/pred_id*
T0*%
_class
loc:@dnn/logits/BiasAdd*:
_output_shapes(
&:?????????:?????????
?
-dnn/zero_fraction_3/cond/count_nonzero_1/CastCast1dnn/zero_fraction_3/cond/count_nonzero_1/NotEqual*'
_output_shapes
:?????????*

DstT0	*

SrcT0

?
.dnn/zero_fraction_3/cond/count_nonzero_1/ConstConst"^dnn/zero_fraction_3/cond/switch_f*
valueB"       *
dtype0*
_output_shapes
:
?
6dnn/zero_fraction_3/cond/count_nonzero_1/nonzero_countSum-dnn/zero_fraction_3/cond/count_nonzero_1/Cast.dnn/zero_fraction_3/cond/count_nonzero_1/Const*
_output_shapes
: *
T0	
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

SrcT0	*
_output_shapes
: *

DstT0

-dnn/zero_fraction_3/counts_to_fraction/Cast_1Castdnn/zero_fraction_3/Size*

SrcT0	*
_output_shapes
: *

DstT0
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
dnn/dnn/logits/activation/tagConst*
dtype0*
_output_shapes
: **
value!B Bdnn/dnn/logits/activation
x
dnn/dnn/logits/activationHistogramSummarydnn/dnn/logits/activation/tagdnn/logits/BiasAdd*
_output_shapes
: 
S
head/logits/ShapeShapednn/logits/BiasAdd*
T0*
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

initNoOp
?
init_all_tablesNoOpj^dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/hash_table/table_initn^dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/hash_table/table_initb^dnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/hash_table/table_initp^dnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/hash_table/table_initj^dnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_table/table_init

init_1NoOp
4

group_depsNoOp^init^init_1^init_all_tables
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
shape: *
dtype0*
_output_shapes
: 
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
save/Identity_6Identitysave/Read_3/ReadVariableOp*
T0*
_output_shapes

: 
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
save/Identity_10Identitysave/Read_5/ReadVariableOp*
_output_shapes
:*
T0
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
save/Identity_13Identitysave/Identity_12"/device:CPU:0*
_output_shapes
:*
T0
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
value3B1 B+_temp_d7e10157c8374c058f2212e16c9642b0/part*
dtype0*
_output_shapes
: 
d
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: 
Q
save/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
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
save/Identity_29Identitysave/Identity_28"/device:CPU:0*
_output_shapes
: *
T0
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
save/Identity_33Identitysave/Identity_32"/device:CPU:0*
_output_shapes
: *
T0
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
save/Identity_41Identitysave/Identity_40"/device:CPU:0*
T0*
_output_shapes
:
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
save/Identity_44Identitysave/Read_22/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:
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
save/Identity_46Identitysave/Read_23/ReadVariableOp"/device:CPU:0*
T0*
_output_shapes
:
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
T0*
N*
_output_shapes
:
u
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0
?
save/Identity_56Identity
save/Const^save/MergeV2Checkpoints^save/control_dependency^save/control_dependency_1"/device:CPU:0*
_output_shapes
: *
T0
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
save/AssignAssignYdnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0save/RestoreV2:6*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/alcohol_use_embedding/embedding_weights/part_0*
_output_shapes

:
?
save/Assign_1Assign[dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0save/RestoreV2:7*
T0*n
_classd
b`loc:@dnn/input_from_feature_columns/input_layer/cigarette_use_embedding/embedding_weights/part_0*
_output_shapes

:
?
save/Assign_2AssignUdnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0save/RestoreV2:8*
T0*h
_class^
\Zloc:@dnn/input_from_feature_columns/input_layer/is_male_embedding/embedding_weights/part_0*
_output_shapes

:
?
save/Assign_3Assign\dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0save/RestoreV2:9*
T0*o
_classe
caloc:@dnn/input_from_feature_columns/input_layer/mother_married_embedding/embedding_weights/part_0*
_output_shapes

:
?
save/Assign_4AssignYdnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0save/RestoreV2:10*
T0*l
_classb
`^loc:@dnn/input_from_feature_columns/input_layer/mother_race_embedding/embedding_weights/part_0*
_output_shapes

:
x
save/Assign_5Assignglobal_stepsave/RestoreV2:11*
T0	*
_class
loc:@global_step*
_output_shapes
: 
?
save/restore_shardNoOp^save/Assign^save/AssignVariableOp^save/AssignVariableOp_1^save/AssignVariableOp_2^save/AssignVariableOp_3^save/AssignVariableOp_4^save/AssignVariableOp_5^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5
?
save/RestoreV2_1/tensor_namesConst"/device:CPU:0*?
value?B?B"dnn/hiddenlayer_0/batchnorm_0/betaB#dnn/hiddenlayer_0/batchnorm_0/gammaBdnn/hiddenlayer_0/biasBdnn/hiddenlayer_0/kernelB"dnn/hiddenlayer_1/batchnorm_1/betaB#dnn/hiddenlayer_1/batchnorm_1/gammaBdnn/hiddenlayer_1/biasBdnn/hiddenlayer_1/kernelB"dnn/hiddenlayer_2/batchnorm_2/betaB#dnn/hiddenlayer_2/batchnorm_2/gammaBdnn/hiddenlayer_2/biasBdnn/hiddenlayer_2/kernelBdnn/logits/biasBdnn/logits/kernel*
dtype0*
_output_shapes
:
?
!save/RestoreV2_1/shape_and_slicesConst"/device:CPU:0*?
value?B?B32 0,32B32 0,32B32 0,32B15 32 0,15:0,32B22 0,22B22 0,22B22 0,22B32 22 0,32:0,22B15 0,15B15 0,15B15 0,15B22 15 0,22:0,15B1 0,1B15 1 0,15:0,1*
dtype0*
_output_shapes
:
?
save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices"/device:CPU:0*
dtypes
2*x
_output_shapesf
d: : : : :::: ::::::
b
save/Identity_63Identitysave/RestoreV2_1"/device:CPU:0*
T0*
_output_shapes
: 
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
save/Identity_65Identitysave/RestoreV2_1:2"/device:CPU:0*
_output_shapes
: *
T0
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
save/Identity_71Identitysave/RestoreV2_1:8"/device:CPU:0*
_output_shapes
:*
T0
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
save/restore_allNoOp^save/restore_all/NoOp^save/restore_all/NoOp_1"?
save/Const:0save/Identity_56:0save/restore_all (5 @F8"?
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
dnn/logits/bias "(2*dnn/logits/bias/part_0/Initializer/zeros:08"?:
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
dnn/logits/bias "(2*dnn/logits/bias/part_0/Initializer/zeros:08"?
table_initializer?
?
idnn/input_from_feature_columns/input_layer/alcohol_use_embedding/alcohol_use_lookup/hash_table/table_init
mdnn/input_from_feature_columns/input_layer/cigarette_use_embedding/cigarette_use_lookup/hash_table/table_init
adnn/input_from_feature_columns/input_layer/is_male_embedding/is_male_lookup/hash_table/table_init
odnn/input_from_feature_columns/input_layer/mother_married_embedding/mother_married_lookup/hash_table/table_init
idnn/input_from_feature_columns/input_layer/mother_race_embedding/mother_race_lookup/hash_table/table_init"?-
cond_context?-?-
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
!dnn/zero_fraction/cond/switch_t:0i
/dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1:06dnn/zero_fraction/cond/count_nonzero/NotEqual/Switch:1D
 dnn/zero_fraction/cond/pred_id:0 dnn/zero_fraction/cond/pred_id:0
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
!dnn/zero_fraction/cond/switch_f:0k
/dnn/hiddenlayer_0/batchnorm_0/batchnorm/add_1:08dnn/zero_fraction/cond/count_nonzero_1/NotEqual/Switch:0D
 dnn/zero_fraction/cond/pred_id:0 dnn/zero_fraction/cond/pred_id:0
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
#dnn/zero_fraction_3/cond/switch_t:0H
"dnn/zero_fraction_3/cond/pred_id:0"dnn/zero_fraction_3/cond/pred_id:0P
dnn/logits/BiasAdd:08dnn/zero_fraction_3/cond/count_nonzero/NotEqual/Switch:1
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
"dnn/zero_fraction_3/cond/pred_id:0"dnn/zero_fraction_3/cond/pred_id:0"k
global_step\Z
X
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0"%
saved_model_main_op


group_deps*?
predict?
0

mother_age"
Placeholder_1:0?????????
4
mother_married"
Placeholder_5:0?????????
1
alcohol_use"
Placeholder_7:0?????????
/
	plurality"
Placeholder_3:0?????????
5
gestation_weeks"
Placeholder_4:0?????????
3
cigarette_use"
Placeholder_6:0?????????
+
is_male 
Placeholder:0?????????
1
mother_race"
Placeholder_2:0?????????:
predictions+
dnn/logits/BiasAdd:0?????????tensorflow/serving/predict