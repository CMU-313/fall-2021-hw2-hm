��    q      �  �   ,      �	      �	      �	  (   �	  )   �	  )   
      H
  B  i
  �   �    �  :   �     �  
   �     �  D   �  	   2  )   <     f     ~     �     �  	   �     �     �     �     �  #     	   %     /  	   =     G     L     T    U  �   X  2  �  u    ^   �  8   �  C     �   c  2  (  �   [  �  P  �   �  b   �                             +   (   E      n      {   F   �   N   �      %!     7!     Q!     a!     h!     m!  Q   v!     �!     �!  =   �!     "     "     #"     2"     7"     ?"  @   ^"  &   �"  	   �"     �"  ^   �"     C#     _#  %   f#  '   �#  (   �#     �#  =   �#     3$     K$  H   R$     �$  	   �$     �$     �$     �$     �$     �$     �$     �$  U   %  d   Z%  b   �%  ?   "&  M   b&     �&     �&  3   �&  !   �&     '     '     ''     ;'     P'  x  _'  w   �(     P)  �  l)      �*  !   +  ,   5+  .   b+  1   �+  $   �+  y  �+  �   b-  c  I.  D   �1     �1     �1     2  K   2     \2  7   n2     �2     �2     �2     �2     �2  )   �2  	   '3     13     I3  &   b3  	   �3     �3     �3     �3     �3  �   �3  +  �4  �   �5  G  �6  �  �7  \   �9  7   �9  T   *:  �   :  �  T;  7  Q?    �@  �   �B  {   nC  F  �C     1E     LE     SE  #   aE  1   �E     �E     �E  R   �E  m   =F  !   �F     �F     �F     	G     G  	   G  S    G     tG     zG  ?   �G     �G     �G     �G     �G     �G  2   �G  @   .H  "   oH  
   �H     �H  r   �H  &   *I     QI  %   XI  -   ~I  .   �I     �I  T   �I  &   FJ  	   mJ  Z   wJ     �J     �J     �J     �J     K     K  	   =K     GK     MK  l   TK  z   �K  x   <L  5   �L  o   �L     [M  	   dM  4   nM  (   �M     �M     �M     �M     N      N  �  9N  �   P  (   �P         
           &   o   %   l   Y   G   8   P          H         A   q   0          c   1   /   "   M   #   _   7   R   Q                  +   f       I   *       <   j   B       2              ;   n   5   :   )   D   [   >      !      E          b   (   i   K          g       N       U   6              ]              @       `                     Z                p   4   9   S              C   T   a               \          -   X   3   W       J   V          ?       m          d         .   O   L   h   '              ,   e       =   $         k   ^      	      F    %(object)s created successfully. %(object)s deleted successfully. %(object)s not created, error: %(error)s %(object)s not deleted, error: %(error)s. %(object)s not updated, error: %(error)s. %(object)s updated successfully. A dictionary containing the settings for all databases to be used with Django. It is a nested dictionary whose contents map a database alias to a dictionary containing the options for an individual database. The DATABASES setting must configure a default database; any number of additional databases may also be specified. A list of strings designating all applications that are enabled in this Django installation. Each string should be a dotted Python path to: an application configuration class (preferred), or a package containing an application. A list of strings representing the host/domain names that this site can serve. This is a security measure to prevent HTTP Host header attacks, which are possible even under many seemingly-safe web server configurations. Values in this list can be fully qualified names (e.g. 'www.example.com'), in which case they will be matched against the request's Host header exactly (case-insensitive, not including port). A value beginning with a period can be used as a subdomain wildcard: '.example.com' will match example.com, www.example.com, and any other subdomain of example.com. A value of '*' will match anything; in this case you are responsible to provide your own validation of the Host header (perhaps in a middleware; if so this middleware must be listed first in MIDDLEWARE). A storage backend that all workers can use to share files. About About this Add An integer specifying how many objects should be displayed per page. Anonymous Automatically enable logging to all apps. Available attributes: 
 Available fields: 
 Celery Check for updates Clear all Clear error log entries for: %s Common Common periodic Current user details Current user locale profile details Dashboard Date and time Date time Days Default Default: "amqp://". Default broker URL. This must be a URL in the form of: transport://userid:password@hostname:port/virtual_host Only the scheme part (transport://) is required, the rest is optional, and defaults to the specific transports default values. Default: '' (Empty string). Password to use for the SMTP server defined in EMAIL_HOST. This setting is used in conjunction with EMAIL_HOST_USER when authenticating to the SMTP server. If either of these settings is empty, Django won't attempt authentication. Default: '' (Empty string). Username to use for the SMTP server defined in EMAIL_HOST. If empty, Django won't attempt authentication. Default: '/accounts/login/' The URL where requests are redirected for login, especially when using the login_required() decorator. This setting also accepts named URL patterns which can be used to reduce configuration duplication since you don't have to define the URL in two places (settings and URLconf). Default: '/accounts/profile/' The URL where requests are redirected after login when the contrib.auth.login view gets no next parameter. This is used by the login_required() decorator, for example. This setting also accepts named URL patterns which can be used to reduce configuration duplication since you don't have to define the URL in two places (settings and URLconf). Default: 'django.core.mail.backends.smtp.EmailBackend'. The backend to use for sending emails. Default: 'localhost'. The host to use for sending email. Default: 25. Port to use for the SMTP server defined in EMAIL_HOST. Default: 2621440 (i.e. 2.5 MB). The maximum size (in bytes) that an upload will be before it gets streamed to the file system. See Managing files for details. See also DATA_UPLOAD_MAX_MEMORY_SIZE. Default: 2621440 (i.e. 2.5 MB). The maximum size in bytes that a request body may be before a SuspiciousOperation (RequestDataTooBig) is raised. The check is done when accessing request.body or request.POST and is calculated against the total request size excluding any file upload data. You can set this to None to disable the check. Applications that are expected to receive unusually large form posts should tune this setting. The amount of request data is correlated to the amount of memory needed to process the request and populate the GET and POST dictionaries. Large requests could be used as a denial-of-service attack vector if left unchecked. Since web servers don't typically perform deep request inspection, it's not possible to perform a similar check at that level. See also FILE_UPLOAD_MAX_MEMORY_SIZE. Default: False. Whether to use a TLS (secure) connection when talking to the SMTP server. This is used for explicit TLS connections, generally on port 587. If you are experiencing hanging connections, see the implicit TLS setting EMAIL_USE_SSL. Default: False. Whether to use an implicit TLS (secure) connection when talking to the SMTP server. In most email documentation this type of TLS connection is referred to as SSL. It is generally used on port 465. If you are experiencing problems, see the explicit TLS setting EMAIL_USE_TLS. Note that EMAIL_USE_TLS/EMAIL_USE_SSL are mutually exclusive, so only set one of those settings to True. Default: No result backend enabled by default. The backend used to store task results (tombstones). Refer to http://docs.celeryproject.org/en/v4.1.0/userguide/configuration.html#result-backend Default: None. Specifies a timeout in seconds for blocking operations like the connection attempt. Default: [] (Empty list). List of compiled regular expression objects representing User-Agent strings that are not allowed to visit any page, systemwide. Use this for bad robots/crawlers. This is only used if CommonMiddleware is installed (see Middleware). Delete stale uploads Django Documentation Edit current user details Edit current user locale profile details Edit details Edit locale profile Enable error logging outside of the system error logging capabilities. Enter a valid 'internal name' consisting of letters, numbers, and underscores. Error log entries Error log entries for: %s Error log entry Errors File Filename Force the conversion of the database even if the receiving database is not empty. Forum Hours It is not possible to determine the latest version available. Language License Locale profile Main Minutes Must select at least one item. Name of the view attached to the branch anchor in the main menu. Name to be displayed in the main menu. Namespace No action selected. No results here means that don't have the required permissions to perform administrative task. No setup options available. Object Object error log cleared successfully Operation performed on %(count)d object Operation performed on %(count)d objects Other packages licenses Path to the logfile that will track errors during production. Process a specific app. Remove Restricts dumped data to the specified app_label or app_label.ModelName. Result Selection Setup Setup items Shared uploaded file Shared uploaded files Source code Support System Temporary directory used site wide to store thumbnails, previews and temporary files. The database from which data will be exported. If omitted the database named "default" will be used. The database to which data will be imported. If omitted the database named "default" will be used. The version you are using is outdated. The latest version is %s Time to delay background tasks that depend on a database commit to propagate. Timezone Tools URL of the installation or homepage of the project. Unable to transfer selection: %s. User User details User locale profile User locale profiles View error log When set to True, if the request URL does not match any of the patterns in the URLconf and it doesn't end in a slash, an HTTP redirect is issued to the same URL with a slash appended. Note that the redirect may cause any data submitted in a POST request to be lost. The APPEND_SLASH setting is only used if CommonMiddleware is installed (see Middleware). See also PREPEND_WWW. Your database backend is set to use SQLite. SQLite should only be used for development and testing, not for production. Your version is up-to-date. Project-Id-Version: Mayan EDMS
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2019-03-31 21:38+0000
Last-Translator: Mathias Behrle <mathiasb@m9s.biz>
Language-Team: German (Germany) (http://www.transifex.com/rosarior/mayan-edms/language/de_DE/)
Language: de_DE
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
 %(object)s erfolgreich erstellt. %(object)s erfolgreich gelöscht. %(object)s nicht erstellt, Fehler: %(error)s %(object)s nicht gelöscht, Fehler: %(error)s. %(object)s nicht aktualisiert, Fehler: %(error)s. %(object)s erfolgreich aktualisiert. Ein Dictionary welches eine Liste aller Einstellungen für die mit Django verwendeten Datenbanken enthält. Dieses Dictionary enthält Aliase zu einem weiteren Dictionaries, welche wiederum die Einstellungen für weitere Datenbanken enthalten. Die DATABASES Einstellung muss eine Standarddatenbank enthalten, es können aber auch beliebige weitere Datenbanken angegeben werden. Eine Liste aller Applikationen (String), welche für diese Django-Installation aktiviert sind. Jede Zeichenfolge muss ein punktuierter Pythonpfad zu einer Anwendungskonfigurationsklasse (bevorzugt) oder einem Anwendungspaket sein. Eine Liste aller Hosts bzw. Domainnamen, die mit dieser Seite funktionieren. Sie dient als  Sicherheitsmaßnahme um Angriffe über HTTP Hostheader zu verhindern, welche selbst unter vermeintlich sicheren Webserverkonfigurationen möglich sein können. Werte in dieser Liste können voll qualifizierte Domainnamen enthalten, die exakt gegen den Hostheader des Requests geprüft werden (ohne Prüfung von Groß-/Kleinschreibung und Port). Werte, die mit einem Punkt beginnen werden wie eine Subdomain Wildcard behandelt, so steht  z.B. '.example.com' für 'example.com' oder 'www.example.com' oder jede andere Subdomain von example.com. '*' steht als Wert für alles Mögliche, in diesem Fall sind Sie selbst verantwortlich für eine Validierung des Hostheaders (z.B. mittels einer Middleware. Sollte das der Fall sein, muss diese in MIDDLEWARE zuerst gelistet werden). Datenbackend, das alle Worker benutzen können, um Dateien zu teilen Über Über Mayan Hinzufügen Eine Ganzzahl, die die Anzahl der angezeigten Datensätze pro Seite angibt. Anonymer Benutzer Protokollierung für alle Apps automatisch einschalten. Verfügbare Attribute:
 Verfügbare Felder:
 Celery Nach Updates suchen Alles löschen Alle Fehlerlogeinträge für: %s löschen Allgemein Allgemein wiederkehrend Aktuelle Benutzerdetails Aktuelle Benutzerlokalisierungsdetails Dashboard Datum und Uhrzeit Zeit Tage Standard Standard: "amqp://". Die Standard Broker-URL. Muss in folgender Form angegeben werden: transport://userid:password@hostname:port/virtual_host
Nur das Schema (transport://) muss angegeben werden, der Rest ist optional und verweist auf die Standardwerte. Standard: " (Leere Zeichenfolge). Das Passwort zur Nutzung des SMTP-Servers, der in EMAIL_HOST definiert wurde. Diese Einstellung wird zusammen mit der für EMAIL_HOST_USER für die Authentifizierung am SMTP-Server genutzt. Wird eine der beiden leer gelassen, benutzt Django keine Authentifizierung. Standard: " (Leere Zeichenfolge). Der Benutzername zur Nutzung des SMTP-Servers, der in EMAIL_HOST definiert wurde. Wird die Einstellung leer gelassen, benutzt Django keine Authentifizierung. Standard: '/accounts/login/' Die URL zur Weiterleitung zum Login, insbesondere wenn z.B. der login_required() Decorator benutzt wird. Diese Einstellung akzeptiert auch die Eingabe von URL-Mustern, wenn z.B. mehrfach gleiche Konfigurationen an verschiedenen Stellen vermieden werden sollen (z.B. in 'Einstellungen' und URLconf). Standard: '/accounts/profile/' Die URL zur Weiterleitung von Requests nach erfolgreichem Login, insbesondere wenn die Ansicht contrib.auth.login keinen next Parameter übermittelt bekommt. Wird z.B. vom login_required() Decorator benutzt. Diese Einstellung akzeptiert auch die Eingabe von URL-Mustern, wenn mehrfach gleiche Konfigurationen an verschiedenen Stellen vermieden werden sollen (z.B. in 'Einstellungen' und URLconf). Standard: 'django.core.mail.backends.smtp.EmailBackend'. Das Backend für den E-Mailversand. Standard: 'localhost'. Der Host für den E-Mailversand. Standard: 25. Der für den in EMAIL_HOST definierten SMTP-Server zu benutzende Port. Standard: 2621440 (entspricht 2,5 MB). Die Maximalgröße eines Uploads in Bytes, bevor dieser zum Dateisystem gestreamt wird. Mehr Details im Kapitel zum Dateimanagement. Siehe auch: DATA_UPLOAD_MAX_MEMORY_SIZE. Standard: 2621440 (entspricht 2,5 MB). Die Maximalgröße eines Requestbodys in Bytes, für Werte darüber wird die Aktion 'SuspiciousOperation - RequestDataTooBig' ausgelöst. Diese Prüfung wird immer ausgeführt, wenn auf  'request.body' oder 'request.POST' zugegriffen wird. Dabei wird die Gesamtgröße des Requests berechnet ohne Einbezug der Größe einer eventuell hochzuladenen Datei. Die Einstellung 'None' deaktiviert diese Prüfung. Anwendungen, welche erwartungsgemäß umfangreichere Formularanfragen erhalten, sollten diese Einstellung entsprechend anpassen. Der Umfang an Requestdaten korreliert mit dem zur Verarbeitung benötigten Speicher und dem benötigten Speicher zur Befüllung der GET und POST Dictionaries. Sehr umfangreiche Requests könnten ungeprüft einem Denial-of-Service Angriff dienen. Da Webserver für gewöhnlich eine solch gründliche Prüfung der Anfragen nicht durchführen, ist eine vergleichbare Prüfung auf Dieser Ebene nicht möglich. Siehe auch: FILE_UPLOAD_MAX_MEMORY_SIZE. Standard: False. Definiert ob eine TLS Verbindung (sichere Verbindung) beim Verbinden zum SMTP-Server aufgebaut werden soll. Wird für explizite TLS-Verbindungen, üblicherweise über den Port 587, verwendet. Sollte es zu Verbindungsfehlern kommen, prüfen Sie bitte die implizite TLS Einstellung EMAIL_USE_SSL. Standard: False. Definiert ob eine TLS Verbindung (sichere Verbindung) beim Verbinden zum SMTP Server aufgebaut werden soll. Gelegentlich wird diese TLS Verbindung auch als SSL bezeichnet. Die Verbindung nutzt üblicherweise den Port 465. Sollte es zu Verbindungsfehlern kommen, prüfen Sie bitte die explizite TLS Einstellung EMAIL_USE_TLS. Beachten Sie bitte, dass immer nur eine Einstellung für EMAIL_USE_TLS oder EMAIL_USE_SSL genutzt werden kann, es sollte daher immer nur eine Einstellungen auf "True" gestellt werden. Standard: Es ist standardmäßig kein Ergebnisbackend aktiviert. Das Backend speichert die Aufgabenergebnisse (tombstones). Siehe: http://docs.celeryproject.org/en/v4.1.0/userguide/configuration.html#result-backend Standard: None (Keiner). Stellt einen Timeout (in Sekunden) für blockierende Operationen wie z.B. Verbindungsversuche ein. Standard: [] (Leere Liste). Eine Liste von kompilierten regulären Ausdrücken (RegEx) welche diejenigen User-Agent Strings repräsentieren die systemweit keine einzige Seite aufrufen dürfen. Nutzen Sie diese gegen unerwünschte Robots oder Crawler. Wird nur genutzt wenn CommonMiddleware installiert ist (siehe: Middleware). Veraltete Uploads löschen Django Dokumentation Aktuelle Benutzerdetails bearbeiten Aktuelle Benutzerlokalisierungsdetails bearbeiten Details bearbeiten Lokalisierungsprofil bearbeiten Fehlerprotokollierung außerhalb des regulären Systemfehlerprotokolls aktivieren. Bitte geben Sie einen gültigen 'Internen Namen' an, bestehend aus Buchstaben, Zahlen und einem Unterstrich.  Einträge aus dem Fehlerprotokoll Fehlerlogeinträge für: %s Eintrag aus dem Fehlerprotokoll Fehler Datei Dateiname Erzwingt die Umstellung der Datenbank selbst wenn die Zieldatenbank nicht leer ist. Forum Stunden Ermittlung der aktuellsten verfügbaren Version nicht möglich. Sprache Lizenz Lokalisierungsprofil Hauptbereich Minuten Es muss mindestens ein Element ausgewählt werden. Name der dem Zweiganker zugewiesenen Ansicht aus dem Hauptmenü. Der im Hauptmenü angezeigte Name. Namensraum Keine Aktion ausgewählt. Falls keine Ergebnisse angezeigt werden besitzen Sie nicht die erforderlichen Rechte für administrative Aufgaben. Keine Einstellungsoptionen verfügbar. Objekt Objektfehlerlog erfolgreich gelöscht Operation für %(count)d Objekt durchgeführt Operation für %(count)d Objekte durchgeführt Andere Paket-Lizenzen Der Pfad zur Protokolldatei, in der Fehler im Produktivbetrieb aufgezeichnet werden. Führt eine bestimmte Applikation aus. Entfernen Begrenzt die extrahierten Daten auf die spezifizierten app_label oder app_label.ModelName. Ergebnis Auswahl Einrichtung Einrichtungsdetails Geteilte hochgeladene Datei Geteilte hochgeladene Dateien Quelltext Hilfe System Temporäres Verzeichnis zum systemweiten Speichern von Miniaturbildern, Vorschauen und temporären Dateien.  Die Datenbank von welcher die Daten exportiert werden. Falls nicht ausgefüllt wird "default" als Datenbankname verwendet. Die Datenbank in welche die Daten importiert werden. Falls nicht ausgefüllt wird "default" als Datenbankname verwendet. Ihre Version ist veraltet. Die neueste Version ist %s Zeit für die Verzögerung von Hintergrundaufgaben, die für ihre Fortsetzung auf einen Datenbankcommit warten. Zeitzone Werkzeuge Die URL der Installation oder Webseite des Projekts. Auswahl %s kann nicht übertragen werden Benutzer Benutzerdetails Benutzerlokalisierungsprofil Benutzerlokalisierungsprofile Fehlerprotokoll anzeigen Falls "Wahr" (true), wird eine Umleitung (HTTP Redirect) auf die bereitgestellte URL mit angehängtem Slash erzeugt, sofern diese nicht bereits mit einem Slash endet oder einem Muster aus der URLconf entspricht. Bitte beachten Sie, dass die Umleitung den Verlust von Daten aus den übermittelten POST-Requests verursachen kann. Die Einstellung APPEND_SLASH wird nur benutzt, wenn CommonMiddleware installiert ist (siehe Middleware). Siehe auch PREPEND_WWW. Sie benutzen SQLite als Datenbank-Backend. SQLite sollte nur für Entwicklungs- und Testzwecke verwendet werden, jedoch nicht in Produktivumgebungen. Ihre Version ist auf dem neuesten Stand. 