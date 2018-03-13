{$MODE OBJFPC}

unit ULinkedList;

interface

type
    generic TNode<T> = class
    public
        data: T;
        next: specialize TNode<T>;
        constructor Create(value: T);
    end;

implementation

constructor TNode.Create(value: T);
begin
    data := value;
    next := nil;
end;

end.
