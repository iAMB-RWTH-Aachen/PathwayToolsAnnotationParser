function [AmodelAddedInChI]=InChIAnnotations(Amodel,TabDelimFile,Row,Hits,MetPos)
%If you want to customize the type of annotation in this function, you have to
%change the Regular Expression in the next line to a pattern of your desire.
InChIStrSearchCell=regexp(TabDelimFile(Row(Hits),:),'InChI='); 
InChIStrSearchArray = ~cellfun(@isempty,InChIStrSearchCell);
TargetCellInRow= find(InChIStrSearchArray);
     if  ~isempty(TargetCellInRow)
                    %Don't forget to alter or comment out the next line if
                    %you have customized the type of annotation you are
                    %looking for above.
                    FoundStr=regexprep(TabDelimFile{Row(Hits),TargetCellInRow},'^InChI=','');
                    %Remember to change the target cell array to match the 
                    %customized annotation (Amodel.MetCustomAnnotation) 
                    Amodel.metInChIString(MetPos,1)=cellstr(FoundStr);
                end
AmodelAddedInChI=Amodel;
end