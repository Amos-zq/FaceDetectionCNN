function cnet = cnn( Layers, Epochs )
%CNN Summary of this function goes here
%   Detailed explanation goes here

if ( nargin == 1 &&  isstruct(Layers) )
    cnet = class(Layers, 'cnn');
    return
elseif nargin == 0
    Epochs = 10;
    Layers = 1;
end


cnet.epochs = Epochs;
cnet.LayersNum = Layers;
cnet.Ip{1} = 1;

cnet.theta = 0.5;
cnet.theta_dec = 0.8;

for it = 1:cnet.LayersNum
    cnet.Layer{it}.type = 's';
    
    
    cnet.Layer{it}.InputHeight = 2;
    cnet.Layer{it}.InputWidth = 2;
    cnet.Layer{it}.TransferFunction = 'purelin';
    
    cnet.Layer{it}.FMapNum = 1;
    cnet.Layer{it}.ConMap = 1;
    
    cnet.Layer{it}.W = 1;
    cnet.Layer{it}.B = 0;
    
    cnet.Layer{it}.Y{1} = 0; % Wa�one wej�cie
    cnet.Layer{it}.X{1} = 0; % Wyj�cie po funkcji aktywacji
    
    cnet.Layer{it}.dEdW{1} = 0; % Pochodna cz�stkowa b��du po wagach
    cnet.Layer{it}.dEdB{1} = 0; % Pochodna cz�stkowa b��du po biasach
    cnet.Layer{it}.dEdX{1} = 0; % Pochodna cz�stkowa b��du po wyj�cu
    cnet.Layer{it}.dXdY{1} = 0; % Pochodna cz�stkowa wyj�cia po wa�onym wej�ciu
    cnet.Layer{it}.dYdW{1} = 0; % Pochodna cz�stkowa wa�onego wej�cia po wagach
    cnet.Layer{it}.dYdB{1} = 0; % Pochodna cz�stkowa wa�onego wej�cia po biasach
    
end

cnet = class(cnet, 'cnn');
end

