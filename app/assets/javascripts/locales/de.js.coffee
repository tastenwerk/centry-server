Em.I18n.availableTranslations ||= {}
Em.I18n.availableTranslations.de ||= {}

Em.merge Em.I18n.availableTranslations.de,
  alias: 'Alias'
  username_or_email: 'Benutzername oder Email'
  password: 'Passwort'
  login: 'Anmelden'
  no_account_yet: 'Noch kein Konto?'
  forgot_your_password: 'Passwort vergessen?'
  back_to_login: 'Zurück zum Login'
  signup: 'Kostenlos Registrieren'
  confirmation_code: 'Bestätigungs-Code'
  continue: 'Weiter'
  register: 'Registrieren'
  username: 'Alias'
  email: 'Email Adresse'
  organization: 'Organisation'
  private: 'Privat'
  agree_policies: 'Ich bin mit den Allgemeinen Geschäftsbedingungen einverstanden'
  select_language: 'Sprache wählen'
  errors:
    email_required: 'Email Adresse erforderlich'
    email_exists: 'Die Email Adresse {{email}} ist schon registriert'
    organization_exists: 'Diese Organisation ist bereits registriert'
    not_an_email_address: 'Die angegebene Email Adresse ist ungültig'
    organization_required: 'Wenn du dich als Organisation registrieren möchtest, musst du auch einen Organisationsnamen angeben. Ansonsten wähle "Privat"'
    password_required: 'Bitte wähle ein Passwort'
    password_policies_not_fulfilled: 'Das Passwort entspricht nicht den Kritierien:<br><ul><li>mindestens 6 Zeichen lang</li><li>Enthält mindestens einen Großbuchstaben</li><li>Enthält midnestens einen Kleinbuchstaben</li><li>Enthält mindestens eine Zahl oder ein Sonderzeichen</li></ul>'
    accept_terms: 'Du musst unsere Geschäftsbedingungen akzeptieren, um fortzufahren'
    invalid_code: 'Der angegebene Code ist falsch'
    key_invalid_or_expired: 'Der Schlüssel ist falsch oder abgelaufen. Bitte wiederhole den Vorgang'
    code_required: 'Bitte gib den Code ein, der dir in der Email zugesandt wurde'
    unkown: 'Unbekannter Fehler! Bitte kontaktiere den Support'
