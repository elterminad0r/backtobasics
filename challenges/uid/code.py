from string import ascii_uppercase as uc, digits as d

suc = set(uc)
sd = set(d)

def uid_valid(uid):
    suid = set(uid)
    return (uid.isalnum()
        and len(uid) == len(suid)
        and len(suid & suid) >= 2
        and len(suid & sd) >= 3
        and len(uid) == 10)

def re_valid(uid):
    u = ''.join(sorted(uid))
    try:
        assert re.search(r'[A-Z]{2}', u)
        assert re.search(r'\d\d\d', u)
        assert not re.search(r'[^a-zA-Z0-9]', u)
        assert not re.search(r'(.)\1', u)
        assert len(u) == 10
    except:
        return False
    else:
        return True
