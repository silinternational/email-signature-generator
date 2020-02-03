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
let role = ''
let number = ''
let email = ''
let glyph = '1'
let active = 'Gmail'
let chosenTzAbbr = ''

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
}
form > :global(*) {
  margin-bottom: 1rem;
}
form > :global(label) {
  width: 100%;
}
main > section {
  flex-grow: 1;
}
main > section > nav {
  width: max-content;
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
</style>

<main>
  <form>
    <Textfield bind:value={name} label="Name" input$autofocus variant="outlined" />
    <Textfield bind:value={role} label="Role" variant="outlined" />
    <Textfield bind:value={number} label="Number" variant="outlined" />
    <Textfield bind:value={email} label="Email" variant="outlined" />

    {#each [...Array(NUM_GLYPHS).keys()] as i}
      <FormField>
        <Radio bind:group={glyph} value={`${i + 1}`} />
        <span slot="label">
        <img src={`https://static.sil.org/brand-tool/glyph${i + 1}.png`} alt={`glyph${i + 1}-logo`} class="thumbnail">
        </span>        
      </FormField>
    {/each}

    <!-- TODO: social links -->
    <Select label="Timezone" bind:value={chosenTzAbbr} variant="outlined" withLeadingIcon>
      <span slot="icon"><Icon class="material-icons">language</Icon></span>
      <Option value=""></Option>
        {#each timezones as tz}
          <Option value={tz.abbreviation}>{tz.name} ({tz.offset})</Option>
        {/each}
    </Select>
  </form>

  <section>
    <figure class="mdc-elevation--z3">
      <table style="border-spacing: 0">
        <tr>
          <td style="padding-right: 1rem">
            <img src={`https://static.sil.org/brand-tool/glyph${glyph}.png`} alt={`glyph${glyph} and logo`} style="max-height: 9rem">
          </td>
          <td style="font-family: 'Source Sans Pro'; padding: 0">
            <div style="color: #0b5e97; font-size: xx-large">{name}</div>
            <div>{role}</div>
            <div>
              {number}
              {#if number && email}
                <span style="padding-left: 0.5rem; padding-right: 0.5rem">|</span>
              {/if}
              {email}
            </div>
            <div>{tzDisplay || ''}</div>
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

