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
import Checkbox from '@smui/checkbox'

let name = ''
let org = ''
let showSIL = false
let role = ''
let workNumber = ''
let cellNumber = ''
let email = ''
let glyph = '1'
let active = 'Gmail'
let chosenTzDisplay = ''
let skypeName = ''
let additional = ''

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
nav > ol > li {
  margin-bottom: 1rem;
}
.mb-0 {
  margin-bottom: 0;
}
li + ol {
  list-style-type: lower-alpha;
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
:global(.mr-1) {
  margin-right: .5rem;
}
</style>

<main>
  <form>
    <Textfield bind:value={name} label="Name" input$autofocus variant="outlined" />
    <Textfield bind:value={role} label="Role" variant="outlined" />
    <Textfield bind:value={org} label="Organization / Unit" variant="outlined" />
    <FormField>
      <Checkbox bind:checked={showSIL} />
      <span slot="label">Show SIL International</span>
    </FormField>

    <Textfield bind:value={workNumber} label="Work number" variant="outlined" />
    <Textfield bind:value={cellNumber} label="Cell number" variant="outlined" />
    <Textfield bind:value={email} label="Email" variant="outlined" />

    <Select label="Timezone" bind:value={chosenTzDisplay} variant="outlined" withLeadingIcon>
      <span slot="icon"><Icon class="material-icons">language</Icon></span>
      <Option value=""></Option>
        {#each timezones as tz}
          <Option>{tz.name} ({tz.offset})</Option>
        {/each}
    </Select>

    <div>
      <Textfield bind:value={skypeName} label="Skype name" variant="outlined" withTrailingIcon>
        <img src="skype-icon.svg" alt="Skype logo" class="social-logo">
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

    <Textfield textarea bind:value={additional} label="Additional info" />
  </form>

  <!-- this will abide by HTML email constraints so user can copy/paste into email client -->
  <section>
    <figure class="mdc-elevation--z3"> 
      <table style="border-spacing: 0">
        <tr>
          <td width="170px" style="padding-top: 0.4rem; vertical-align: top">
            <a href="https://www.sil.org">
              <img src={`https://static.sil.org/brand-tool/glyph${glyph}.png`} alt={`glyph${glyph} and logo`} width="150">
            </a>
          </td>
          <td style="font-family: 'Source Sans Pro'; padding: 0">
            <strong style="color: #0b5e97">{name}</strong>

            {#if role}
              <br>
              {role}
            {/if}

            {#if org}
              <br>
              {org}
            {/if}

            {#if showSIL}
              <br>
              <a href="https://www.sil.org">SIL International</a><br>
            {/if}
          </td>
        </tr>
        <tr>
          <td></td>
          <td style="font-family: 'Source Sans Pro'">
            {#if email}
              <br>
              <span style="line-height: 1.5">{email}</span>
            {/if} 

            {#if cellNumber}
              <br>
              <small><strong>M:</strong></small> <span style="line-height: 1.5">{cellNumber}</span>
            {/if}

            {#if workNumber}
              <br>
              <small><strong>O:</strong></small> <span style="line-height: 1.5">{workNumber}</span>
            {/if}

            {#if chosenTzDisplay}
              <br>
              <span style="line-height: 1.5">{chosenTzDisplay}</span>
            {/if}

            {#if skypeName}
              <div style="padding-top: .25rem; padding-bottom: .25rem">
                <img src="https://static.sil.org/brand-tool/skype-icon.png" alt="Skype logo" width="16" style="vertical-align: middle; margin-right: .25rem">
                <span style="line-height: 1rem; vertical-align: middle">{skypeName}</span>
              </div>
            {/if}

            <pre style="margin-top: .25rem; font-family: 'Source Sans Pro'">
              {additional}
            </pre>
          </td>
        </tr>
      </table>
    </figure>

    <nav>
      <header class="mdc-typography--headline5">Email client instructions</header>

      <TabBar tabs={['Gmail', 'Thunderbird', 'Outlook']} let:tab bind:active>
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
            <Button on:click={copy} variant='raised' dense class="mr-1">
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
        {:else if active === 'Outlook'}
          <li>
            <Button on:click={copy} variant='raised' dense class="mr-1">
              Click here
            </Button> 
            to copy the generated signature above
          </li>
          <li>Open Outlook</li>
          <li>Start a <em>New Email</em></li>
          <li>In the top center, click <em>Signature</em> and then select <em>Edit Signatures</em></li>
          <li>In the "Signature Name" section, click the +</li>
          <li>Paste in the window that opens</li>
          <li>Click the disc icon in the top left to save</li>
          <li>Exit the window</li>
          <li>In the top center, click <em>Signature</em> and select your signature</li>
          <li class="mb-0">To make it your default signature:</li>
            <ol>
              <li>In the top center, click <em>Signature</em> and then select <em>Edit Signatures</em></li>
              <li>In “Account” select your SIL gmail account</li>
              <li>In “New messages” (and Replies/forwards if you want) select the saved signature</li>
            </ol>
        {/if}
      </ol>
    </nav>
  </section>
</main>
