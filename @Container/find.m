%Returns cell array of indicies of all non-zero, non-container elements. 

function idx=find(obj,ind)
idx={};

cf=str2func(strcat('@',class(obj)));

if isempty(obj.data)
    return
end

if nargin<2
    ind=[];
end

if ~isa(obj.data,'Container')
        K=find(obj.data);
        for i=1:numel(K)
            indtmp=makeinds(obj,ind,K(i));
            idx=[idx; {indtmp}];
        end

else
    for i=1:numel(obj.data)
        idx=[idx; find(obj.data(i),makeinds(obj,ind,i))];
    end
end

end

function sc=makeinds(obj,ind,idx)
sc=cell(1,1*numel(obj.dimNames)*2);
ntemp=cellfun(@string,cellstr(obj.dimNames),'UniformOutput',false);
[sc{1:2:end-1}]=ntemp{:};
itemp=ind2dims(obj,idx);
[sc{2:2:end}]=itemp{:};
sc=[ind,sc];
end

function out = ind2dims(obj,ind)
n=numel(obj.dimVals);
out=cell(1,n);
if n==1
    if isa(obj.dimVals{1},'cell')
        out{1}=obj.dimVals{1}{ind};
    else
        out{1}=obj.dimVals{1}(ind);
    end
else
idx=cell(1,n);
[idx{:}]=ind2sub(size(obj.data),ind);
for i=1:n
    if isa(obj.dimVals{i},'cell')
        out{i}=obj.dimVals{i}{idx{i}};
    else
        out{i}=obj.dimVals{i}(idx{i});
    end
end
end
end
