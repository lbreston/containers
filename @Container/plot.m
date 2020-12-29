
function varargout=plot(obj,ttl,plottype,t)
if nargin<4
    t=tiledlayout('flow','TileSpacing','compact','Padding','compact');
end
if nargin<3
    plottype='';
end
if nargin<2
    ttl="";
end

try
    plot_(obj,ttl,plottype,t);
catch
    for i=1:numel(obj.data)
        newttl=makettl(obj,ttl,i);
        plot(obj.data(i),newttl,plottype,t);
    end
end
if nargout==1
    varargout{1}=t;
end
end

function S=makettl(obj,ttl,idx)
dnames=cellfun(@(x)strcat(string(x),':'),obj.dimNames,'UniformOutput',false);
dvals=cellfun(@(x)strcat(string(x)," "),ind2dims(obj,idx),'UniformOutput',false);
sc=cell(1,1*numel(dnames)*2);
[sc{1:2:end-1}]=dnames{:};
[sc{2:2:end}]=dvals{:};
S=strcat(ttl,sc{:});
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
