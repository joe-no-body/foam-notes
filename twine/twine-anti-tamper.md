# Twine anti-tamper techniques

#twine #javascript #obfuscation

looking at Twine + SugarCube 2 for now

Basic observations

- Twine expects to find a `<tw-storydata>` tag in the code - if it doesn't, it won't recognize the story file as valid

    ```html
    <tw-storydata name="self-modifying" startnode="1" creator="Twine" creator-version="2.3.16" ifid="2A166475-3A3E-44EF-A407-403B34141931" zoom="1" format="SugarCube" format-version="2.36.1" options="" hidden>
      <style role="stylesheet" id="twine-user-stylesheet" type="text/twine-css"></style>
      <script role="script" id="twine-user-script" type="text/twine-javascript"></script>
      <tw-passagedata pid="1" name="hello world" tags="" position="1172,543" size="100,100">hello world</tw-passagedata>
    </tw-storydata>
    ```

- Twine doesn't preserve custom HTML in imported games - if you export a game, add custom HTML, import it, and re-export it, the custom HTML is lost


- what if you tamper with the attributes of the tags?
  - tw-storydata
    - [ ] name
    - [ ] startnode
    - [ ] creator
    - [ ] creator-version
    - [ ] ifid
    - [ ] zoom
    - [ ] format
    - [ ] format-version
    - [ ] options
  - `id="twine-user-script"`
  - tw-passagedata
    - [ ] pid
      - [ ] what happens if multiple passages have the same pid?
    - [ ] position
    - [ ] size


Techniques

- s/tw-storydata/xyz-storydata/g -> Twine won't even recognize the story file as valid when importing
  - bonus: after renaming, add a new `<tw-storydata>` tag with an anti tamper message - the game will still play correctly, but not after importing it into Twine


Ideas

- JS obfuscation
- encrypt passage data so it's harder to figure out what's going on
- checksum story contents to prevent tampering at runtime
- encrypt save data
