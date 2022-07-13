unit ViewModel;

interface

uses
  FMX.ImgList, FMX.Graphics, FMX.Objects, Generics.Collections,  Model;

type TViewModel = class
  private
    //FModel: TModel;
    FImageList: TList<TBitmap>;
  public
    function GetModelImages: TList<TBitmap>;
end;

implementation

{ TViewModel }

function TViewModel.GetModelImages: TList<TBitmap>;
begin
  var lModel: TModel := TModel.Create;
  if Assigned(FImageList) then
    Result := FImageList
  else
  begin
    Result := TList<TBitmap>.Create;
    for var i: integer := 1 to lModel.GetModelDataCount do
    begin
      var lBmp: TBitmap := TBitmap.Create;
      var lMemStream := lModel.GetModelDataStream(i);
      lBmp.LoadFromStream(lMemStream);
      Result.Add(lBmp);
      lMemStream.Free;
    end;
    FImageList := Result;
  end;
  lModel.Free;
end;

end.
