{$MODE OBJFPC}

program PAddressBook;

uses SysUtils;

type
    RAddr = record
        house_no: shortint;
        street: string[32];
        city: string[32];
        postcode: string[16];
    end;

    RPerson = record
        surname: string[32];
        name: string[32];
        phone: string[32];
        dob: TDateTime;
        id: word;
    end;

    RContact = record
        person: RPerson;
        address: RAddr;
    end;

    TContact = class
    private
        function getdetails: RContact;
        procedure setdetails(det: RContact);
        property details: RContact read getdetails write setdetails;
    public
        function fmt: string;
    end;

function TContact.fmt: string;
begin
    result := Format('Name: %s' + sLineBreak
                   + 'Surname: %s' + sLineBreak
                   + 'Phone: %s' + sLineBreak
                   + 'Birthday: %s' + sLineBreak
                   + 'Address:' + sLineBreak
                   + '%d %s' + sLineBreak
                   + '%s' + sLineBreak
                   + '%s',
                     [self.details.person.name,
                      self.details.person.surname,
                      self.details.person.phone,
                      DateTimeToStr(self.details.person.dob),
                      self.details.address.house_no,
                      self.details.address.street,
                      self.details.address.city,
                      self.details.address.postcode]);
end;

function TContact.getdetails: RContact;
begin
    result := self.details;
end;

procedure TContact.setdetails(det: RContact);
begin
    self.details := det;
end;

var
    guido: TContact;
    guido_det: RContact;
begin
    guido := TContact.create;
    with guido_det do begin
        with person do begin
            name := 'Guido';
            surname := 'van Rossum';
            phone := '+31 4159256';
            dob := StrToDate('31-01-1956');
        end;
        with address do begin
            house_no := 8;
            street := 'De Amstel';
            city := 'Haarlem';
            postcode := 'PY7 H0N';
        end;
    end;

    guido.details := guido_det;

    writeln(guido.fmt());
end.
