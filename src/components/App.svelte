<script>
import Textfield from '@smui/textfield'
import Radio from '@smui/radio'
import FormField from '@smui/form-field'
import Tab, {Label} from '@smui/tab'
import TabBar from '@smui/tab-bar'
import Button from '@smui/button'
import timezones from '../data/tz'
import Select, {Option} from '@smui/select'
import Icon from '@smui/select/icon'

let name = ''
let org = ''
let role = ''
let number = ''
let email = ''
let glyph = '1'
let active = 'Gmail'
let chosenTzAbbr = ''
let skypeName = ''

$: chosenTz = chosenTzAbbr && timezones.find(tz => tz.abbreviation === chosenTzAbbr)
$: tzDisplay = chosenTz && `${chosenTz.name} (${chosenTz.offset})`

const NUM_GLYPHS = 5

function copy() {
  navigator.clipboard.writeText(document.querySelector('figure').innerHTML)
}
</script>

<style>
:global(body) {
  margin: 3rem;
}

main {
  display: flex;
  flex-direction: row;
}
form {
  margin-right: 2rem;
  width: 55ch;

  /* wanted this container to be scrollable so the demo never goes out of sight */
  max-height: 100vh;
  overflow-y: scroll;
  padding-top: 0.5rem; /* floating label was getting cutoff */
}
form > :global(*) {
  margin-bottom: 1rem;
}
form :global(label) {
  width: 100%;
}
main > section {
  flex-grow: 1;
}
nav > header {
  padding-top: 3rem;
  padding-bottom: 1rem;
}
nav > ol {
  padding-bottom: 1rem;
  margin-bottom: 0;

  border-bottom: solid;
  border-color: #0b5e97;
  border-width: 2px;
  border-radius: 1rem;
}
figure {
  margin: 0;
  padding: 2rem;
}
.thumbnail {
  max-height: 3rem;
}
.social-logo {
  height: 30px;
  left: auto;
  right: 16px;
  position: absolute;
  top: 13px;
}
</style>

<main>
  <form>
    <Textfield bind:value={name} label="Name" input$autofocus variant="outlined" />
    <Textfield bind:value={role} label="Role" variant="outlined" />
    <Textfield bind:value={org} label="Organization / Unit" variant="outlined" />

    <Textfield bind:value={number} label="Number" variant="outlined" />
    <Textfield bind:value={email} label="Email" variant="outlined" />

    <Select label="Timezone" bind:value={chosenTzAbbr} variant="outlined" withLeadingIcon>
      <span slot="icon"><Icon class="material-icons">language</Icon></span>
      <Option value=""></Option>
        {#each timezones as tz}
          <Option value={tz.abbreviation}>{tz.name} ({tz.offset})</Option>
        {/each}
    </Select>

    <div>
      <Textfield bind:value={skypeName} label="Skype name" variant="outlined" withTrailingIcon>
        <img src="https://secure.skypeassets.com/content/dam/scom/legal/brand-guidelines/skype-icon.svg" alt="Skype logo" class="social-logo">
      </Textfield>
    </div>
    <!-- TODO: social links -->

    {#each [...Array(NUM_GLYPHS).keys()] as i}
      <FormField>
        <Radio bind:group={glyph} value={`${i + 1}`} />
        <span slot="label">
          <img src={`https://static.sil.org/brand-tool/glyph${i + 1}.png`} alt={`glyph${i + 1}-logo`} class="thumbnail">
        </span>        
      </FormField>
    {/each}
  </form>

  <!-- this will abide by HTML email constraints so user can copy/paste into email client -->
  <section>
    <figure class="mdc-elevation--z3"> 
      <table style="border-spacing: 0">
        <tr>
          <td style="padding-right: 1rem; padding-top: 0.4rem; vertical-align: top">
            <a href="https://www.sil.org">
              <img src={`https://static.sil.org/brand-tool/glyph${glyph}.png`} alt={`glyph${glyph} and logo`} style="max-height: 5rem">
            </a>
          </td>
          <td style="font-family: 'Source Sans Pro'; padding: 0">
            <div style="color: #0b5e97; font-size: large">{name}</div>
            <div>{role}</div>
            <div>{org}</div>
            <div>
              {number}
              {#if number && email}
                <span style="padding-left: 0.5rem; padding-right: 0.5rem">|</span>
              {/if}
              {email}
            </div>
            <div>{tzDisplay || ''}</div>
            {#if skypeName}
              <div>Skype: {skypeName}</div>
            {/if}
          </td>
        </tr>
      </table>
    </figure>

    <nav>
      <header class="mdc-typography--headline5">Email client instructions</header>

      <TabBar tabs={['Gmail', 'Thunderbird']} let:tab bind:active>
        <Tab {tab}>
          <Label>{tab}</Label>
        </Tab>
      </TabBar>

      <ol class="mdc-typography--body1">
        {#if active === 'Gmail'}
          <li>Highlight all of the generated signature above and copy it to your clipboard</li>
          <li>Open Gmail</li>
          <li>In the top right, click <em>Settings</em></li>
          <li>In the "Signature" section, paste in the box.</li>
          <li>At the bottom of the page, click Save Changes.</li>
        {:else if active === 'Thunderbird'}
          <li>
            <Button on:click={copy} variant='raised' dense>
              Click here
            </Button> 
            to copy the generated signature above
          </li>
          <li>Open Thunderbird</li>
          <li>View account settings in <em>Accounts</em></li>
          <li>Go to <em>Signature text</em></li>
          <li>Click <em>Use HTML</em></li>
          <li>Paste</li>
          <li>Click <em>OK</em></li>
        {/if}
      </ol>
    </nav>
  </section>
</main>

