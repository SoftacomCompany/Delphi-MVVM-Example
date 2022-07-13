unit View.Controller;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, View.Controller.Atom;

type
  TControllerFrame = class(TFrame)
    FlowLayout: TFlowLayout;
    AtomFrame1: TAtomFrame;
    AtomFrame2: TAtomFrame;
    AtomFrame3: TAtomFrame;
  private
    FAtoms: TArray<TAtomFrame>;
  public
    function EnumAtoms:TArray<TAtomFrame>;
  end;

implementation

{$R *.fmx}

{ TControllerFrame }

function TControllerFrame.EnumAtoms: TArray<TAtomFrame>;
begin
  if Length(FAtoms) <> 0 then
    Result := FAtoms
  else
  begin
    for var i: Integer := 0 to ComponentCount - 1 do
      if Components[i] is TAtomFrame then
      begin
        SetLength(Result, Length(Result) + 1);
        Result[Length(Result) - 1] := TAtomFrame(Components[i]);
      end;
    FAtoms := Result;
  end;
end;

end.
