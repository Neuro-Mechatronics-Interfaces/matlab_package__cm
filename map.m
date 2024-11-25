function cmapdata = map(name, options)
%MAP Return custom colormap data.
%
% Syntax:
%   cmapdata = cm.map();
%   cmapdata = cm.map('mapname');
%   cmapdata = cm.map('mapname', 'Name', value, ...);
%   cm.map('help'); % Returns valid values for 'mapname' and descriptions.
%
% Inputs:
%   name - 'greenred' (default) | ... (any struct field of `out`)
%
% Output:
%   cmapdata - [256 x 3] colormap
%
% Example:
%
% See also: Contents

arguments
    name (1,1) string {mustBeTextScalar, mustBeMember(name, ["skin_light", "skin_tan", "skin_brown", "skin_dark", "rosette", "tartan", "greenred", "state", "bluered", "jet", "parula", "copper", "winter", "spring", "summer", "autumn", "bone", "hsv", "turbo"])} = "greenred";
    options.DataType (1,1) string {mustBeTextScalar, mustBeMember(options.DataType, ["uint8", "double", "single"])} = "uint8";
    options.N (1,1) = nan; % If non-NaN, must be positive-integer; will specify the number of elements in returned colormap in that case. Otherwise, returns the colormap as-is.
end

out = struct;
% % % BEGIN: 'tartan' % % %
out.tartan.data = ...
    uint8(...
    [196, 18, 48;      % Carnegie Red
       0,  0,  0;      % Black
     109,110,113;      % Iron Grey
     224,224,224;      % Steel Gray
     239, 58, 71;      % Scots Red
     253,181, 21;      % Gold Thread
       0,150, 71;      % Green Thread
       0,143,145;      % Teal Thread
       4, 54,115;      % Blue Thread
       0,123,192   ... % Highlands Sky Blue
     ]);
out.tartan.desc = 'Carnegie Mellon University primary pallette is first-four rows ({Carnegie Red, Black, Iron Grey, Steel Gray}). Secondary pallette is last-6 rows ({Scots Rose, Gold Thread, Green Thread, Teal Thread, Blue Thread, Highlands Sky Blue}).';
% % % END: 'tartan' % % %
% % % BEGIN: 'rosette' % % %
out.rosette.data = ...
        uint8(...
    [255,195,165;
    247,179,162;
    238,163,160;
    230,146,157;
    221,130,155;
    213,113,152;
    205,97,150;
    196,80,147;
    184,69,146;
    159,72,150;
    135,76,154;
    110,79,158;
    86,82,162;
    61,86,166;
    37,89,170;
    12,93,173;
    0,93,172;
    0,92,165;
    0,90,159;
    0,88,152;
    0,86,145;
    0,84,139;
    0,83,132;
    0,81,125;
    6,90,114;
    15,103,100;
    23,116,87;
    31,129,74;
    40,142,61;
    48,155,47;
    57,169,34;
    65,182,21]);
out.rosette.desc = 'Orange-to-red-to-blue-to-green. For use in +rose package (Rosette class). Only 32 values.';
% % % END: 'rosette' % % %

% % % BEGIN: 'skin_<type>' % % %
out.skin_light.data = [...
    255   222   204
   250   209   186
   242   191   166
   237   173   148
   232   158   135
   227   140   122];
out.skin_light.desc = 'Skin-tone colormap for fair-skin approximation.';

out.skin_tan.data = [...
    250   209   176
   240   194   153
   227   176   128
   214   158   105
   201   140    84];
out.skin_tan.desc = 'Tan-tone colormap for tan-skin approximation.';

out.skin_brown.data = [ ...
    186   140   112
   171   128    97
   153   110    79
   135    92    64
   120    77    51];
out.skin_brown.desc = 'Brown-tone colormap for brown-skin approximation.';

out.skin_dark.data = [ ...
    107    84    71
    92    71    59
    79    61    48
    66    51    41
    51    38    31];
out.skin_dark.desc = 'Dark-tone colormap for dark-skin approximation.';
% % % END: 'skin_<type>' % % %

% % % BEGIN: 'state' % % %
out.state.data =  uint8(...
     [ ...
        1       10      20      % Rich Black FOGRA 29
        148     35      69      % Big Dip Oruby
        107     79      115     % English Violet
        66      122     161     % Steel Blue
        127     140     152     % Light Slate Gray
        75      138     210     % Tufts Blue
        103     148     54      % Maximum Green
        165     190     0       % Acid Green
        212     235     65 ...  % Maximum Green Yellow
      ] ...
);   
out.state.desc = 'Black-red-blue-green-yellow progression. For center-out task state color maps.';
% % % END: 'state' % % %

% % %

% % % BEGIN: 'bluered' % % %
out.bluered.data = ...
        uint8(...
    [...
    0     0   131
    0     1   133
    1     2   135
    1     3   137
    1     5   139
    1     6   140
    2     7   142
    2     8   144
    2     9   146
    3    10   148
    3    12   149
    3    13   151
    4    14   153
    4    15   155
    4    16   157
    4    17   158
    5    19   160
    5    20   162
    5    21   164
    6    22   166
    6    23   167
    6    24   169
    6    25   171
    7    27   173
    7    28   175
    7    29   176
    8    30   178
    8    31   180
    8    32   182
    9    34   184
    9    35   185
    9    36   187
    9    37   189
    10    38   191
    10    39   192
    10    41   194
    11    42   196
    11    43   198
    11    44   200
    11    45   201
    12    46   203
    12    47   205
    12    49   207
    13    50   209
    13    51   210
    13    52   212
    14    53   214
    14    54   216
    14    56   218
    14    57   219
    15    58   221
    15    59   223
    15    60   225
    16    61   227
    16    63   228
    16    64   230
    17    65   232
    17    66   234
    17    67   236
    17    68   237
    18    69   239
    18    72   239
    19    74   239
    19    76   239
    20    79   239
    21    81   239
    21    83   240
    22    85   240
    22    88   240
    23    90   240
    23    92   240
    24    94   240
    25    97   240
    25    99   240
    26   101   240
    26   103   240
    27   106   240
    27   108   240
    28   110   240
    29   112   240
    29   115   240
    30   117   241
    30   119   241
    31   122   241
    32   124   241
    32   126   241
    33   128   241
    33   131   241
    34   133   241
    34   135   241
    35   137   241
    36   140   241
    36   142   241
    37   144   241
    37   146   241
    38   149   241
    38   151   242
    39   153   242
    40   156   242
    40   158   242
    41   160   242
    46   160   239
    52   161   235
    57   161   232
    63   161   229
    68   161   225
    73   162   222
    79   162   219
    84   162   215
    90   162   212
    95   163   209
    101   163   206
    106   163   202
    112   163   199
    117   164   196
    122   164   192
    128   164   189
    133   164   186
    136   165   185
    139   166   183
    141   167   182
    144   168   181
    147   169   180
    150   170   178
    152   171   177
    155   172   176
    158   173   175
    160   174   173
    163   175   172
    166   176   171
    169   177   170
    171   178   168
    174   178   167
    177   179   166
    179   180   165
    182   181   163
    185   182   162
    188   183   161
    190   184   160
    193   185   158
    196   186   157
    198   187   156
    201   188   155
    204   189   153
    207   190   152
    209   191   151
    212   192   150
    215   193   148
    217   193   147
    218   192   143
    219   191   139
    220   189   135
    221   188   132
    222   186   128
    223   185   124
    224   184   120
    225   182   116
    226   181   112
    227   179   108
    228   178   105
    228   176   101
    229   175    97
    230   174    93
    231   172    89
    232   171    85
    233   169    81
    234   168    77
    235   166    74
    236   165    70
    237   164    66
    238   162    62
    239   161    58
    240   159    54
    240   158    50
    241   157    46
    242   155    43
    243   154    39
    244   152    35
    245   151    31
    246   149    27
    247   148    23
    247   144    23
    247   141    22
    248   138    22
    248   134    21
    248   131    20
    248   127    20
    248   124    19
    249   120    19
    249   117    18
    249   113    18
    249   110    17
    249   106    16
    249   103    16
    250    99    15
    250    96    15
    250    92    14
    250    89    14
    250    85    13
    251    82    12
    251    78    12
    251    75    11
    251    71    11
    251    68    10
    252    64    10
    252    61     9
    252    57     8
    252    54     8
    252    50     7
    253    47     7
    253    43     6
    253    40     6
    253    36     5
    253    33     5
    254    29     4
    254    26     3
    254    22     3
    254    19     2
    254    15     2
    255    12     1
    255     8     1
    255     5     0
    254     1     0
    252     0     0
    248     0     0
    244     0     0
    240     0     0
    236     0     0
    232     0     0
    229     0     0
    225     0     0
    221     0     0
    217     0     0
    213     0     0
    209     0     0
    205     0     0
    201     0     0
    197     0     0
    194     0     0
    190     0     0
    186     0     0
    182     0     0
    178     0     0
    174     0     0
    170     0     0
    166     0     0
    162     0     0
    159     0     0
    155     0     0
    151     0     0
    147     0     0
    143     0     0
    139     0     0
    135     0     0
    131     0     0
    128     0     0]);
out.bluered.desc = 'Blue to red map for stimulating patch, with greyish values in middle range.';
% % % END: 'bluered' % % %

% % % BEGIN: 'greenred' % % %
out.greenred.data = ...
        uint8(...
    [0,255,164;
    0,255,163;
    0,255,163;
    0,255,162;
    0,255,161;
    0,255,161;
    1,255,160;
    1,255,159;
    1,255,159;
    1,255,158;
    1,255,158;
    1,255,157;
    1,255,156;
    1,255,156;
    1,255,155;
    1,255,155;
    1,255,154;
    1,255,153;
    2,255,153;
    2,255,152;
    2,255,151;
    2,255,151;
    2,255,150;
    2,255,150;
    2,255,149;
    2,255,148;
    2,255,148;
    2,255,147;
    2,255,147;
    2,255,146;
    3,255,145;
    3,255,145;
    3,255,144;
    3,255,143;
    3,255,143;
    3,255,142;
    3,255,142;
    3,255,141;
    3,255,140;
    3,255,140;
    3,255,139;
    3,255,138;
    4,255,138;
    4,255,137;
    4,255,137;
    4,255,136;
    4,255,135;
    4,255,135;
    4,255,134;
    4,255,134;
    4,255,133;
    4,255,132;
    4,255,132;
    4,255,131;
    5,255,130;
    5,255,130;
    5,255,129;
    5,255,129;
    5,255,128;
    5,255,127;
    5,255,127;
    5,255,126;
    5,255,125;
    5,255,125;
    5,255,124;
    6,254,122;
    6,254,121;
    7,253,119;
    7,253,118;
    7,252,116;
    8,252,115;
    8,251,113;
    8,251,112;
    9,250,110;
    9,250,109;
    9,249,107;
    10,249,105;
    10,248,104;
    10,248,102;
    11,247,101;
    11,247,99;
    11,246,98;
    12,246,96;
    12,245,95;
    12,245,93;
    13,244,91;
    13,244,90;
    13,243,88;
    14,243,87;
    14,242,85;
    14,242,84;
    15,241,82;
    15,241,81;
    15,240,79;
    16,240,77;
    16,239,76;
    16,239,74;
    17,238,73;
    17,238,71;
    17,237,70;
    18,237,68;
    18,236,67;
    18,236,65;
    19,235,64;
    19,235,62;
    19,234,60;
    20,233,59;
    20,233,57;
    20,232,56;
    21,232,54;
    21,231,53;
    21,231,51;
    22,230,50;
    22,230,48;
    22,229,46;
    23,229,45;
    23,228,43;
    23,228,42;
    24,227,40;
    24,227,39;
    24,226,37;
    25,226,36;
    25,225,34;
    26,225,32;
    26,224,31;
    26,224,29;
    27,223,28;
    27,223,26;
    28,221,25;
    31,218,25;
    33,214,24;
    36,211,24;
    38,208,24;
    40,205,23;
    43,202,23;
    45,198,23;
    48,195,22;
    50,192,22;
    52,189,21;
    55,185,21;
    57,182,20;
    60,179,20;
    62,176,20;
    65,172,19;
    67,169,19;
    69,166,18;
    72,163,18;
    74,159,18;
    77,156,17;
    79,153,17;
    82,150,17;
    84,146,16;
    86,143,16;
    89,140,15;
    91,137,15;
    94,134,14;
    96,130,14;
    99,127,14;
    101,124,13;
    103,121,13;
    106,117,13;
    108,114,12;
    111,111,12;
    113,108,11;
    116,104,11;
    118,101,10;
    120,98,10;
    123,95,10;
    125,91,9;
    128,88,9;
    130,85,8;
    132,82,8;
    135,79,8;
    137,75,7;
    140,72,7;
    142,69,7;
    145,66,6;
    147,62,6;
    149,59,5;
    152,56,5;
    154,53,4;
    157,49,4;
    159,46,4;
    162,43,3;
    164,40,3;
    166,36,3;
    169,33,2;
    171,30,2;
    174,27,1;
    176,24,1;
    179,20,0;
    181,17,0;
    182,16,2;
    183,16,4;
    183,16,6;
    184,15,9;
    185,15,11;
    185,15,13;
    186,15,16;
    187,14,18;
    187,14,20;
    188,14,23;
    188,13,25;
    189,13,27;
    190,13,30;
    190,13,32;
    191,12,34;
    192,12,37;
    192,12,39;
    193,12,41;
    194,11,44;
    194,11,46;
    195,11,48;
    196,11,51;
    196,10,53;
    197,10,55;
    197,10,58;
    198,10,60;
    199,9,62;
    199,9,65;
    200,9,67;
    201,9,69;
    201,8,72;
    202,8,74;
    203,8,76;
    203,8,79;
    204,7,81;
    205,7,83;
    205,7,86;
    206,7,88;
    206,6,90;
    207,6,93;
    208,6,95;
    208,6,97;
    209,5,99;
    210,5,102;
    210,5,104;
    211,5,106;
    212,4,109;
    212,4,111;
    213,4,113;
    214,4,116;
    214,3,118;
    215,3,120;
    215,3,123;
    216,3,125;
    217,2,127;
    217,2,130;
    218,2,132;
    219,2,134;
    219,1,137;
    220,1,139;
    221,1,141;
    221,1,144;
    222,0,146;
    223,0,148 ...
    ]);
out.greenred.desc = 'Green to red map for impedances (as in TMSi.)';
% % % END: 'greenred' % % %

f = fieldnames(out);
if strcmpi(name, 'help')
    fprintf(1,'\n<strong>The following are valid custom colormap names</strong>:\n\n');
    for ii = 1:numel(f)
        fprintf(1, '\b\t->\t''%s'': %s\n\n', f{ii}, out.(f{ii}).desc);
    end
    cmapdata = uint8(out.greenred.data);
    if nargout < 1
        clear cmapdata   % suppresses `ans` variable
    end
elseif ~ismember(name, f)
    try % Make sure to not mess up current figure etc. when returning default colormaps.
        r = groot;
        switchback = ~isempty(r.Children);
        if switchback
            prev_fig = gcf;
        end
        tmp = figure('Name', 'placeholder', 'Visible', 'off');
        cmapdata = colormap(name);
        cmapdata = uint8(round(cmapdata .* 255));
        close(tmp);
        delete(tmp);
        if switchback
            figure(prev_fig);
        end
    catch err
        warning('Invalid custom colormap name (%s). Check field names of `out` for valid values.', name);
        rethrow(err);
    end
else
    cmapdata = uint8(out.(name).data);
end
if ~strcmpi(options.DataType, "uint8")
    switch options.DataType
        case "double"
            cmapdata = double(cmapdata) ./ 255.0;
        case "single"
            cmapdata = single(cmapdata) ./ single(255.0);
        otherwise
            error("Not set up to handle '%s' DataType option yet.", options.DataType);
    end
end

if ~isnan(options.N)
    cmObj = cm.cmap([1, options.N], cmapdata);
    cmapdata = cmObj(1:options.N);
end

end