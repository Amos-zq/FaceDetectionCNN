function [ I ] = loadImages( folder, num )
%LoadImages Za�aduj obrazki do treningu
%   folder - pattern nazwy pliku zawieraj�ce jedno podstawienie '%d' 
%   w miejscu gdzie ma by� numer obrazka
%   num - ilo�c obrazk�w do wczytania
    
    I = cell(1, num);
    for it = 1:num
        tmp = imread(sprintf(folder, it));
        I{it} = reshape(mapstd(reshape(double((tmp)),1,[])),36,32);
        %I{it} = double((tmp));
    end;
end

