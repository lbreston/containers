function out  = subsref (obj, S)

switch S(1).type
    case '.'
        out =builtin('subsref', obj, S);
    case '()'
        if (numel(obj)>1)||isa(S(1).subs{1},'numeric')
            out = builtin('subsref', obj, S);
        else
            if  isempty(S(1).subs)
                cf=str2func(strcat('@',class(obj)));
                out = cf(obj);
            elseif isa(S(1).subs{1},'cell')
                 out = subfcncell(obj,S(1).subs{:});
            else
                out = subfcn(obj,S(1).subs{:});
            end
        end
    case '{}'
        error('Not a supported indexing expression')
end

end


function out = subfcncell(obj,C)

out=cell(size(C));

for i=1:numel(C)
    out{i}=subfcn(obj,C{i}{:});
end

end



function out = subfcn(obj,varargin)
argStruct=struct(varargin{:});
cf=str2func(strcat('@',class(obj)));

if isempty(obj.data)
    out = cf();
    return
end

if numel(obj.data)==1
    if isempty(argStruct)
        out=obj;
    else
        out=cf();
    end
    return
end

newDimVals=obj.dimVals;

if length(obj.dimNames)==1
    if isfield(argStruct,obj.dimNames)
        fn=obj.dimNames{:};
        
        newDimVals{1}=argStruct.(fn);
        
        if isa(newDimVals{1},'function_handle')
            newDimVals{1}=obj.dimVals{1}(newDimVals{1}(obj.dimVals{1}));
        end
        
        for j=1:numel(newDimVals{1})
            idx(j)=find(obj.dimVals{1}==newDimVals{1}(j));
        end
        
        argStruct=rmfield(argStruct,obj.dimNames);
        
    else
        newDimVals{1}=obj.dimVals{1};
        idx=1:numel(obj.dimVals{1});
        
    end
    idx={idx};
else
    
    rmlist={};
    for i=1:length(obj.dimNames)
        if isfield(argStruct,obj.dimNames{i})
            fn=obj.dimNames{i};
            newDimVals{i}=argStruct.(fn);
            
            if isa(newDimVals{i},'function_handle')
                newDimVals{i}=obj.dimVals{i}(newDimVals{i}(obj.dimVals{i}));
            end

            for j=1:numel(newDimVals{i})
                idx{i}(j)=find(obj.dimVals{i}==newDimVals{i}(j));
            end
            
            rmlist=[rmlist,fn];
            
        else
            idx{i}=1:numel(obj.dimVals{i});
        end
    end
    for i=1:length(rmlist)
        argStruct=rmfield(argStruct,rmlist{i});
    end
end

sdata=obj.data(idx{:});

argCell=namedargs2cell(argStruct);

if ~isempty(argCell)
    if isa(sdata,'Container')
        sdata=arrayfun(@(x)subfcn(x,argCell{:}),sdata);
    else
        sdata=cf();
    end
end

if numel(sdata)==1
    out=sdata;
else
    out=cf(sdata,obj.dimNames,newDimVals);
end

end
