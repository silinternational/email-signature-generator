<script>
import Textfield from '@smui/textfield'
import Radio from '@smui/radio'
import FormField from '@smui/form-field'
import Tab, {Icon, Label} from '@smui/tab'
import TabBar from '@smui/tab-bar'
import Button from '@smui/button'

let name = ''
let role = ''
let number = ''
let email = ''
let glyph = '1'
let active = 'Gmail'

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
  width: 50ch;
}
form > :global(*) {
  margin-bottom: 1rem;
}
form > :global(label) {
  width: 100%;
}
nav {
  margin-bottom: 2rem;
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
  flex-grow: 1;
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
        <img src={`glyph${i + 1}.png`} alt={`glyph${i + 1}-logo`} class="thumbnail">
      </FormField>
    {/each}

    <!-- TODO: social links -->
    <!-- TODO: tz selector? -->
    <!-- TODO: need favicon? -->
  </form>

  <section>
    <nav>
      <TabBar tabs={['Gmail', 'Thunderbird', 'Outlook']} let:tab bind:active>
      
        <Tab {tab}>
          <Label>{tab}</Label>
        </Tab>
      </TabBar>

      <ol class="mdc-typography--body1">
        {#if active === 'Gmail'}
          <li>Highlight all of the generated signature below and copy it to your clipboard</li>
          <li>Open Gmail</li>
          <li>In the top right, click <em>Settings</em></li>
          <li>In the "Signature" section, paste in the box.</li>
          <li>At the bottom of the page, click Save Changes.</li>
        {:else if active === 'Thunderbird'}
          <li>
            <Button on:click={copy} variant='raised' dense>
              Click here
            </Button> 
            to copy the generated signature below
          </li>
          <li>Open Thunderbird</li>
          <li>View account settings in <em>Accounts</em></li>
          <li>Go to <em>Signature text</em></li>
          <li>Click <em>Use HTML</em></li>
          <li>Paste</li>
          <li>Click <em>OK</em></li>
        {:else if active === 'Outlook'}
          instructions still needed
        {/if}
      </ol>
    </nav>

    <figure class="mdc-elevation--z3">
      <table style="padding: 2rem">
        <tr>
          <td>
            <img src={`glyph${glyph}.png`} alt={`glyph${glyph} and logo`} style="max-height: 9rem">
          </td>
          <td style="font-family: 'Source Sans Pro'">
            <div style="color: #0b5e97; font-size: xx-large">{name}</div>
            <div>{role}</div>
            <div>
              {number}
              {#if number && email}
                <span style="padding-left: 0.5rem; padding-right: 0.5rem">|</span>
              {/if}
              {email}
            </div>
          </td>
        </tr>
      </table>
    </figure>
  </section>
</main>

